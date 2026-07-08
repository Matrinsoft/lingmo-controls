import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Button {
    id: control

    property bool accent: false

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingMedium
    bottomPadding: Theme.metrics.spacingMedium
    leftPadding: Theme.metrics.spacingLarge + (accent && !flat ? Theme.metrics.spacingSmall : 0)
    rightPadding: Theme.metrics.spacingLarge + (accent && !flat ? Theme.metrics.spacingSmall : 0)
    spacing: Theme.metrics.spacingSmall

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    contentItem: Text {
        text: control.text
        font: control.font
        color: {
            if (!control.enabled)
                return control.accent ? Theme.palette.accentForeground : Theme.palette.foreground
            if (control.accent)
                return Theme.palette.accentForeground
            if (control.flat && control.hovered)
                return Theme.palette.accent
            return Theme.palette.foreground
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 4
        implicitHeight: Theme.metrics.spacingLarge * 3

        radius: Theme.metrics.radiusMedium
        color: {
            if (!control.enabled)
                return control.accent ? Theme.palette.accent : Theme.palette.surface
            if (control.pressed)
                return control.accent ? Qt.darker(Theme.palette.accent, 1.15)
                                      : Qt.darker(Theme.palette.surface, 1.05)
            if (control.hovered)
                return control.accent ? Qt.lighter(Theme.palette.accent, 1.1)
                                      : Qt.lighter(Theme.palette.surface, 1.03)
            if (control.accent)
                return Theme.palette.accent
            if (control.flat || control.highlighted)
                return "transparent"
            return Theme.palette.surface
        }

        border {
            width: {
                if (control.accent && control.enabled)
                    return 0
                if (control.flat && control.enabled)
                    return control.hovered || control.visualFocus ? 1 : 0
                return control.enabled ? 1 : 0
            }
            color: {
                if (!control.enabled)
                    return Theme.palette.border
                if (control.visualFocus)
                    return Theme.palette.accent
                if (control.hovered && control.flat)
                    return Theme.palette.borderHover
                if (control.accent)
                    return "transparent"
                return Theme.palette.border
            }
        }

        Behavior on color {
            NumberAnimation { duration: Theme.animation("fast").duration; easing.type: Easing.InOutQuad }
        }
    }
}
