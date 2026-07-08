import QtQuick
import QtQuick.Controls as T
import QtQuick.Controls.impl as Impl
import Lingmo.Theme

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingMedium
    rightPadding: Theme.metrics.spacingLarge * 2
    spacing: Theme.metrics.spacingSmall

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    delegate: ItemDelegate {
        implicitWidth: ListView.view.width
        implicitHeight: Theme.metrics.spacingLarge * 2

        contentItem: Text {
            text: control.textAt(index)
            font: control.font
            color: enabled ? Theme.palette.foreground : Theme.palette.foreground
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            leftPadding: Theme.metrics.spacingSmall
        }

        background: Rectangle {
            color: hovered ? Qt.rgba(Theme.palette.accent.r, Theme.palette.accent.g,
                                     Theme.palette.accent.b, 0.12) : "transparent"
        }
    }

    contentItem: Text {
        text: control.displayText
        font: control.font
        color: control.enabled ? Theme.palette.foreground : Theme.palette.foreground
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    indicator: Text {
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        text: "▼"
        font.pixelSize: Theme.metrics.fontSizeSmall
        color: control.enabled ? Theme.palette.foreground : Theme.palette.border
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 4
        implicitHeight: Theme.metrics.spacingLarge * 2

        radius: Theme.metrics.radiusSmall
        color: control.enabled ? Theme.palette.background : Theme.palette.surface

        border {
            width: control.visualFocus ? 2 : 1
            color: {
                if (!control.enabled)
                    return Theme.palette.border
                if (control.visualFocus)
                    return Theme.palette.accent
                if (control.hovered)
                    return Theme.palette.borderHover
                return Theme.palette.border
            }
        }

        Behavior on border.color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }

    popup: T.Popup {
        y: control.height + Theme.metrics.spacingXXSmall
        implicitWidth: control.width
        implicitHeight: Math.min(contentItem.implicitHeight, Theme.metrics.spacingLarge * 8)
        topPadding: Theme.metrics.spacingXXSmall
        bottomPadding: Theme.metrics.spacingXXSmall

        contentItem: ListView {
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            clip: true
        }

        background: Rectangle {
            radius: Theme.metrics.radiusSmall
            color: Theme.palette.background
            border {
                width: 1
                color: Theme.palette.border
            }
        }
    }
}
