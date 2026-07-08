import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.ScrollBar {
    id: control

    implicitWidth: horizontal ? Theme.metrics.spacingXXLarge * 3 : Theme.metrics.spacingMedium
    implicitHeight: horizontal ? Theme.metrics.spacingMedium : Theme.metrics.spacingXXLarge * 3

    topPadding: horizontal ? Theme.metrics.spacingXXSmall : 0
    bottomPadding: horizontal ? Theme.metrics.spacingXXSmall : 0
    leftPadding: horizontal ? 0 : Theme.metrics.spacingXXSmall
    rightPadding: horizontal ? 0 : Theme.metrics.spacingXXSmall
    minimumSize: 0.1

    contentItem: Rectangle {
        x: control.horizontal ? control.leftPadding + control.visualPosition * (control.availableWidth - width)
                              : control.leftPadding
        y: control.horizontal ? control.topPadding
                              : control.topPadding + control.visualPosition * (control.availableHeight - height)
        implicitWidth: control.horizontal ? control.availableWidth * control.size : control.availableWidth
        implicitHeight: control.horizontal ? control.availableHeight : control.availableHeight * control.size

        radius: width > height ? height / 2 : width / 2
        color: {
            if (!control.enabled)
                return Theme.palette.border
            if (control.pressed)
                return Theme.palette.borderHover
            if (control.hovered)
                return Theme.palette.borderHover
            return Theme.palette.border
        }

        opacity: {
            if (control.interactive)
                return control.hovered || control.pressed ? 0.8 : 0.4
            return 0.0
        }

        Behavior on opacity {
            NumberAnimation { duration: Theme.animation("fast").duration }
        }
    }

    background: Rectangle {
        radius: width > height ? height / 2 : width / 2
        color: Theme.palette.background
        opacity: control.interactive && (control.hovered || control.pressed) ? 0.5 : 0.0

        Behavior on opacity {
            NumberAnimation { duration: Theme.animation("fast").duration }
        }
    }
}
