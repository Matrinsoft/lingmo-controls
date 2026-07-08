import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.DelayButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingLarge
    rightPadding: Theme.metrics.spacingLarge

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    contentItem: Item {
        implicitWidth: contentText.implicitWidth
        implicitHeight: contentText.implicitHeight

        Text {
            id: contentText
            anchors.centerIn: parent
            text: control.text
            font: control.font
            color: control.enabled ? Theme.palette.accentForeground : Theme.palette.foreground
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -Theme.metrics.spacingXXSmall
            width: parent.width * control.progress
            height: 2
            radius: 1
            color: Theme.palette.accentForeground
            visible: control.pressed && control.progress > 0
        }
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 3
        implicitHeight: Theme.metrics.spacingLarge * 2.5

        radius: Theme.metrics.radiusMedium
        color: {
            if (!control.enabled)
                return Theme.palette.surface
            if (control.pressed)
                return Qt.darker(Theme.palette.accent, 1.1)
            if (control.hovered)
                return Qt.lighter(Theme.palette.accent, 1.05)
            return Theme.palette.accent
        }

        Behavior on color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }
}
