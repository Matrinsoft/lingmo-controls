import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.BusyIndicator {
    id: control

    implicitWidth: Theme.metrics.spacingXXLarge * 2
    implicitHeight: Theme.metrics.spacingXXLarge * 2

    contentItem: Item {
        implicitWidth: parent.width
        implicitHeight: parent.height

        Repeater {
            model: 12

            Rectangle {
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2 - parent.height / 2 + Theme.metrics.spacingMedium
                width: Theme.metrics.spacingXXSmall
                height: Theme.metrics.spacingSmall
                radius: width / 2
                color: Theme.palette.accent
                opacity: 1.0 - (index / 12)
                antialiasing: true
                transformOrigin: Item.Center

                transform: Rotation {
                    origin.x: 0
                    origin.y: parent.height / 2 - Theme.metrics.spacingMedium
                    angle: (index / 12) * 360
                }

                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    running: control.running

                    PauseAnimation { duration: index * 80 }
                    NumberAnimation {
                        from: 1.0
                        to: 0.1
                        duration: 400
                        easing.type: Easing.InOutQuad
                    }
                    PauseAnimation { duration: (11 - index) * 80 }
                }
            }
        }
    }
}
