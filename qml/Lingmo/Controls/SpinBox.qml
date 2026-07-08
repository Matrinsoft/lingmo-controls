import QtQuick
import QtQuick.Controls as T
import QtQuick.Layouts
import Lingmo.Theme

T.SpinBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingMedium
    rightPadding: Theme.metrics.spacingMedium

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    contentItem: TextInput {
        text: control.displayText
        font: control.font
        color: control.enabled ? Theme.palette.foreground : Theme.palette.foreground
        selectionColor: Theme.palette.highlight
        selectedTextColor: Theme.palette.highlightForeground
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        y: 0
        width: Theme.metrics.spacingLarge * 1.5
        height: parent.height / 2

        color: up.pressed ? Qt.lighter(Theme.palette.surface, 1.05)
                          : up.hovered ? Qt.lighter(Theme.palette.surface, 1.02)
                                       : Theme.palette.surface

        border {
            width: 1
            color: control.visualFocus ? Theme.palette.accent : Theme.palette.border
        }

        Text {
            anchors.centerIn: parent
            text: "▲"
            font.pixelSize: Theme.metrics.fontSizeSmall
            color: control.enabled ? Theme.palette.foreground : Theme.palette.border
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        y: parent.height / 2
        width: Theme.metrics.spacingLarge * 1.5
        height: parent.height / 2

        color: down.pressed ? Qt.lighter(Theme.palette.surface, 1.05)
                            : down.hovered ? Qt.lighter(Theme.palette.surface, 1.02)
                                           : Theme.palette.surface

        border {
            width: 1
            color: control.visualFocus ? Theme.palette.accent : Theme.palette.border
        }

        Text {
            anchors.centerIn: parent
            text: "▼"
            font.pixelSize: Theme.metrics.fontSizeSmall
            color: control.enabled ? Theme.palette.foreground : Theme.palette.border
        }
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 3
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
}
