import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.PageIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: 0
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    spacing: Theme.metrics.spacingXXSmall

    delegate: Rectangle {
        implicitWidth: control.currentIndex === index
                       ? Theme.metrics.spacingMedium : Theme.metrics.spacingSmall
        implicitHeight: Theme.metrics.spacingXXSmall
        radius: height / 2

        color: control.currentIndex === index
               ? Theme.palette.accent
               : Qt.rgba(Theme.palette.foreground.r, Theme.palette.foreground.g,
                         Theme.palette.foreground.b, 0.3)

        Behavior on implicitWidth {
            NumberAnimation { duration: Theme.animation("fast").duration }
        }

        Behavior on color {
            ColorAnimation { duration: Theme.animation("fast").duration }
        }
    }

    background: Item {}
}
