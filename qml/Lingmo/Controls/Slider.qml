import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Slider {
    id: control

    implicitWidth: horizontal ? Theme.metrics.spacingXXLarge * 5 : Theme.metrics.spacingLarge
    implicitHeight: horizontal ? Theme.metrics.spacingLarge : Theme.metrics.spacingXXLarge * 5

    topPadding: horizontal ? Theme.metrics.spacingSmall : 0
    bottomPadding: horizontal ? Theme.metrics.spacingSmall : 0
    leftPadding: horizontal ? 0 : Theme.metrics.spacingSmall
    rightPadding: horizontal ? 0 : Theme.metrics.spacingSmall

    background: Rectangle {
        x: control.horizontal ? control.leftPadding : (control.width - implicitWidth) / 2
        y: control.horizontal ? (control.height - implicitHeight) / 2 : control.topPadding
        implicitWidth: control.horizontal ? control.availableWidth : Theme.metrics.spacingXXSmall
        implicitHeight: control.horizontal ? Theme.metrics.spacingXXSmall : control.availableHeight

        radius: height / 2
        color: Theme.palette.surface
        border {
            width: 1
            color: Theme.palette.border
        }

        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : parent.height - height
            width: control.horizontal ? parent.width * control.visualPosition : parent.width
            height: control.horizontal ? parent.height : parent.height * control.visualPosition

            radius: height / 2
            color: Theme.palette.accent
        }
    }

    handle: Rectangle {
        x: control.horizontal ? control.leftPadding + control.visualPosition * (control.availableWidth - width)
                              : (control.width - width) / 2
        y: control.horizontal ? (control.height - height) / 2
                              : control.topPadding + control.visualPosition * (control.availableHeight - height)
        implicitWidth: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        implicitHeight: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        radius: width / 2

        color: {
            if (!control.enabled)
                return Theme.palette.surface
            if (control.pressed)
                return Qt.darker(Theme.palette.accent, 1.1)
            if (control.hovered)
                return Qt.lighter(Theme.palette.accent, 1.1)
            return Theme.palette.accent
        }

        border {
            width: control.visualFocus ? 2 : 0
            color: control.visualFocus ? Theme.palette.highlight : "transparent"
        }

        Behavior on color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }
}
