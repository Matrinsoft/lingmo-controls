import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.ProgressBar {
    id: control

    implicitWidth: horizontal ? Theme.metrics.spacingXXLarge * 4 : Theme.metrics.spacingLarge
    implicitHeight: horizontal ? Theme.metrics.spacingLarge : Theme.metrics.spacingXXLarge * 4

    background: Rectangle {
        x: control.horizontal ? 0 : (control.width - implicitWidth) / 2
        y: control.horizontal ? (control.height - implicitHeight) / 2 : 0
        implicitWidth: control.horizontal ? control.availableWidth : Theme.metrics.spacingSmall
        implicitHeight: control.horizontal ? Theme.metrics.spacingSmall : control.availableHeight

        radius: height / 2
        color: Theme.palette.surface
        border {
            width: 1
            color: Theme.palette.border
        }
    }

    contentItem: Item {
        implicitWidth: control.horizontal ? control.availableWidth : Theme.metrics.spacingSmall
        implicitHeight: control.horizontal ? Theme.metrics.spacingSmall : control.availableHeight

        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : parent.height - height
            width: control.horizontal ? parent.width * control.position : parent.width
            height: control.horizontal ? parent.height : parent.height * control.position

            radius: height / 2
            color: Theme.palette.accent
            visible: !control.indeterminate
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            radius: height / 2
            color: Theme.palette.accent
            visible: control.indeterminate

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation {
                    from: 0.3
                    to: 1.0
                    duration: Theme.animation("slow").duration
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    from: 1.0
                    to: 0.3
                    duration: Theme.animation("slow").duration
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
