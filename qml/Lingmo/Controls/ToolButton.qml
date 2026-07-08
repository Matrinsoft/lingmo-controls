import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Button {
    id: control

    flat: true

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingSmall
    rightPadding: Theme.metrics.spacingSmall
    spacing: Theme.metrics.spacingXXSmall

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    contentItem: Text {
        text: control.text
        font: control.font
        color: {
            if (!control.enabled)
                return Theme.palette.foreground
            if (control.pressed || control.checked)
                return Theme.palette.accent
            if (control.hovered)
                return Theme.palette.accent
            return Theme.palette.foreground
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 2
        implicitHeight: Theme.metrics.spacingLarge * 3

        radius: Theme.metrics.radiusSmall
        color: {
            if (!control.enabled)
                return "transparent"
            if (control.pressed || control.checked)
                return Qt.rgba(Theme.palette.accent.r, Theme.palette.accent.g,
                               Theme.palette.accent.b, 0.15)
            if (control.hovered)
                return Qt.rgba(Theme.palette.foreground.r, Theme.palette.foreground.g,
                               Theme.palette.foreground.b, 0.08)
            return "transparent"
        }

        Behavior on color {
            NumberAnimation { duration: Theme.animation("fast").duration; easing.type: Easing.InOutQuad }
        }
    }
}
