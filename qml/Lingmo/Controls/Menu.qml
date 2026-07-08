import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Menu {
    id: control

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    topPadding: Theme.metrics.spacingXXSmall
    bottomPadding: Theme.metrics.spacingXXSmall

    delegate: T.MenuItem {
        id: menuItem

        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding)

        topPadding: Theme.metrics.spacingSmall
        bottomPadding: Theme.metrics.spacingSmall
        leftPadding: Theme.metrics.spacingMedium
        rightPadding: Theme.metrics.spacingMedium
        spacing: Theme.metrics.spacingSmall

        font: control.font

        contentItem: Text {
            leftPadding: menuItem.subMenu ? 0 : Theme.metrics.spacingSmall
            rightPadding: menuItem.subMenu ? Theme.metrics.spacingSmall : 0
            text: menuItem.text
            font: menuItem.font
            color: menuItem.enabled ? Theme.palette.foreground : Theme.palette.foreground
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: Theme.metrics.radiusXXSmall
            color: {
                if (!menuItem.enabled)
                    return "transparent"
                if (menuItem.highlighted || menuItem.hovered)
                    return Qt.rgba(Theme.palette.accent.r, Theme.palette.accent.g,
                                   Theme.palette.accent.b, 0.12)
                return "transparent"
            }

            Behavior on color {
                ColorAnimation { duration: Theme.animation("fast").duration }
            }
        }

        indicator: Item {
            implicitWidth: Theme.metrics.spacingLarge
            implicitHeight: Theme.metrics.spacingLarge
            visible: menuItem.subMenu || menuItem.checkable

            Text {
                anchors.centerIn: parent
                text: menuItem.subMenu ? ">" : (menuItem.checked ? "✓" : "")
                color: Theme.palette.foreground
                font: menuItem.font
                visible: menuItem.subMenu || menuItem.checked
            }
        }

        arrow: Text {
            x: parent.width - width - parent.rightPadding
            y: parent.topPadding + (parent.availableHeight - height) / 2
            text: "›"
            color: Theme.palette.foreground
            font: menuItem.font
        }
    }

    background: Rectangle {
        radius: Theme.metrics.radiusMedium
        color: Theme.palette.background
        border {
            width: 1
            color: Theme.palette.border
        }

        layer.enabled: true
        layer.effect: Item {
            anchors.fill: parent
        }
    }

    itemWidth: {
        var maxW = 0
        for (var i = 0; i < control.count; i++) {
            var item = control.itemAt(i)
            if (item && item.implicitWidth > maxW)
                maxW = item.implicitWidth
        }
        return Math.max(maxW + Theme.metrics.spacingMedium * 2, Theme.metrics.spacingXXLarge * 4)
    }
}
