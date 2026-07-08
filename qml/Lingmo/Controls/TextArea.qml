import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.TextArea {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
    implicitHeight: implicitBackgroundHeight + topInset + bottomInset

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingMedium
    rightPadding: Theme.metrics.spacingMedium

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    color: control.enabled ? Theme.palette.foreground : Theme.palette.foreground
    selectionColor: Theme.palette.highlight
    selectedTextColor: Theme.palette.highlightForeground
    placeholderTextColor: {
        if (!control.enabled)
            return Theme.palette.border
        return Qt.rgba(Theme.palette.foreground.r, Theme.palette.foreground.g,
                       Theme.palette.foreground.b, 0.45)
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 6
        implicitHeight: Theme.metrics.spacingLarge * 4

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
