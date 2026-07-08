import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.RangeSlider {
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
            x: control.horizontal ? (parent.width * control.first.visualPosition) : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : (parent.height * control.second.visualPosition)
            width: control.horizontal ? parent.width * (control.second.visualPosition - control.first.visualPosition) : parent.width
            height: control.horizontal ? parent.height : parent.height * (control.first.visualPosition - control.second.visualPosition)

            radius: height / 2
            color: Theme.palette.accent
        }
    }

    first.handle: Rectangle {
        x: control.horizontal ? control.leftPadding + control.first.visualPosition * (control.availableWidth - width)
                              : (control.width - width) / 2
        y: control.horizontal ? (control.height - height) / 2
                              : control.topPadding + control.first.visualPosition * (control.availableHeight - height)
        implicitWidth: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        implicitHeight: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        radius: width / 2

        color: {
            if (!control.enabled)
                return Theme.palette.surface
            if (control.first.pressed)
                return Qt.darker(Theme.palette.accent, 1.1)
            if (control.first.hovered)
                return Qt.lighter(Theme.palette.accent, 1.1)
            return Theme.palette.accent
        }

        border {
            width: control.first.visualFocus ? 2 : 0
            color: control.first.visualFocus ? Theme.palette.highlight : "transparent"
        }

        Behavior on color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }

    second.handle: Rectangle {
        x: control.horizontal ? control.leftPadding + control.second.visualPosition * (control.availableWidth - width)
                              : (control.width - width) / 2
        y: control.horizontal ? (control.height - height) / 2
                              : control.topPadding + control.second.visualPosition * (control.availableHeight - height)
        implicitWidth: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        implicitHeight: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall
        radius: width / 2

        color: {
            if (!control.enabled)
                return Theme.palette.surface
            if (control.second.pressed)
                return Qt.darker(Theme.palette.accent, 1.1)
            if (control.second.hovered)
                return Qt.lighter(Theme.palette.accent, 1.1)
            return Theme.palette.accent
        }

        border {
            width: control.second.visualFocus ? 2 : 0
            color: control.second.visualFocus ? Theme.palette.highlight : "transparent"
        }

        Behavior on color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }
}
