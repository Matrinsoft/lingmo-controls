import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingMedium + Theme.metrics.spacingSmall
    rightPadding: Theme.metrics.spacingMedium + Theme.metrics.spacingSmall
    spacing: Theme.metrics.spacingSmall

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    contentItem: Text {
        text: control.text
        font: control.font
        color: {
            if (!control.enabled)
                return Theme.palette.foreground
            if (control.checked)
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
        implicitHeight: Theme.metrics.spacingLarge * 2.5

        color: "transparent"

        Rectangle {
            x: 0
            y: parent.height - 2
            width: parent.width
            height: control.checked || control.hovered ? 2 : 0
            color: control.checked ? Theme.palette.accent
                                   : Qt.rgba(Theme.palette.accent.r, Theme.palette.accent.g,
                                             Theme.palette.accent.b, 0.4)

            Behavior on height {
                NumberAnimation { duration: Theme.animation("fast").duration }
            }
        }
    }
}
