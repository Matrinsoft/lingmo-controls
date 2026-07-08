import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.ToolTip {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: Theme.metrics.spacingMedium
    rightPadding: Theme.metrics.spacingMedium

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    contentItem: Text {
        text: control.text
        font: control.font
        color: Theme.palette.background
        wrapMode: Text.Wrap
    }

    background: Rectangle {
        radius: Theme.metrics.radiusSmall
        color: Theme.palette.foreground
        opacity: 0.9
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: Theme.animation("fast").duration
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: Theme.animation("fast").duration
        }
    }
}
