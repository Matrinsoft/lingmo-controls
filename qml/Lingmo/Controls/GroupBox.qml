import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.GroupBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingMedium + (label.length > 0 ? implicitLabelHeight + Theme.metrics.spacingSmall : 0)
    bottomPadding: Theme.metrics.spacingMedium
    leftPadding: Theme.metrics.spacingMedium
    rightPadding: Theme.metrics.spacingMedium

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    label: Text {
        x: control.leftPadding
        y: Theme.metrics.spacingXXSmall
        text: control.title
        font: control.font
        color: Theme.palette.foreground
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 6
        implicitHeight: Theme.metrics.spacingLarge * 4

        radius: Theme.metrics.radiusSmall
        color: "transparent"
        border {
            width: 1
            color: Theme.palette.border
        }
    }
}
