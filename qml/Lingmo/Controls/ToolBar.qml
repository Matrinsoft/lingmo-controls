import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.ToolBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingXXSmall
    bottomPadding: Theme.metrics.spacingXXSmall
    leftPadding: Theme.metrics.spacingSmall
    rightPadding: Theme.metrics.spacingSmall

    background: Rectangle {
        implicitHeight: Theme.metrics.spacingLarge * 2.5
        color: Theme.palette.surface
        border {
            width: 1
            color: Theme.palette.border
        }
    }
}
