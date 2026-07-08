import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Dial {
    id: control

    implicitWidth: Theme.metrics.spacingXXLarge * 3
    implicitHeight: Theme.metrics.spacingXXLarge * 3

    background: Rectangle {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: Math.min(parent.width, parent.height)
        height: Math.min(parent.width, parent.height)
        radius: width / 2

        color: Theme.palette.surface
        border {
            width: 1
            color: control.visualFocus ? Theme.palette.accent : Theme.palette.border
        }

        Behavior on border.color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }

        Repeater {
            model: 12
            Rectangle {
                x: parent.width / 2 + (parent.width / 2 - width - Theme.metrics.spacingXXSmall) * Math.cos(angle)
                y: parent.height / 2 + (parent.height / 2 - height - Theme.metrics.spacingXXSmall) * Math.sin(angle)
                width: 2
                height: Theme.metrics.spacingSmall
                color: Theme.palette.border
                antialiasing: true

                property real angle: ((index / 12) * 2 * Math.PI) - Math.PI / 2

                transform: Rotation {
                    origin.x: 1
                    origin.y: height / 2
                    angle: (index / 12) * 360
                }
            }
        }
    }

    handle: Rectangle {
        implicitWidth: Theme.metrics.spacingMedium
        implicitHeight: Theme.metrics.spacingMedium * 1.5
        radius: Theme.metrics.radiusXXSmall
        color: control.enabled ? Theme.palette.accent : Theme.palette.surface
        border {
            width: control.visualFocus ? 1 : 0
            color: control.visualFocus ? Theme.palette.highlight : "transparent"
        }

        x: background.x + background.width / 2 + (background.width / 2 - width / 2 - Theme.metrics.spacingSmall) * Math.cos(control.angle * Math.PI / 180 - Math.PI / 2) - width / 2
        y: background.y + background.height / 2 + (background.height / 2 - height / 2 - Theme.metrics.spacingSmall) * Math.sin(control.angle * Math.PI / 180 - Math.PI / 2) - height / 2
    }
}
