import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Switch {
    id: control

    implicitWidth: implicitIndicatorWidth + leftPadding + implicitContentWidth + rightPadding
    implicitHeight: Math.max(implicitIndicatorHeight + topPadding + bottomPadding,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: Theme.metrics.spacingSmall
    bottomPadding: Theme.metrics.spacingSmall
    leftPadding: control.mirrored ? Theme.metrics.spacingSmall : Theme.metrics.spacingMedium
    rightPadding: control.mirrored ? Theme.metrics.spacingMedium : Theme.metrics.spacingSmall
    spacing: Theme.metrics.spacingSmall

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    indicator: Item {
        implicitWidth: Theme.metrics.spacingLarge * 1.8
        implicitHeight: Theme.metrics.spacingMedium + Theme.metrics.spacingXXSmall

        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        Rectangle {
            anchors.fill: parent
            radius: height / 2
            color: {
                if (!control.enabled)
                    return control.checked ? Theme.palette.accent : Theme.palette.surface
                if (control.checked)
                    return Theme.palette.accent
                if (control.hovered)
                    return Qt.lighter(Theme.palette.surface, 1.02)
                return Theme.palette.surface
            }
            border {
                width: control.checked ? 0 : 1
                color: {
                    if (!control.enabled)
                        return Theme.palette.border
                    if (control.hovered && !control.checked)
                        return Theme.palette.borderHover
                    return Theme.palette.border
                }
            }

            Behavior on color {
                ColorAnimation { duration: Theme.animation("fast").duration }
            }
        }

        Rectangle {
            x: control.checked ? parent.width - width - 2 : 2
            y: 2
            width: parent.height - 4
            height: parent.height - 4
            radius: width / 2
            color: {
                if (!control.enabled)
                    return Theme.palette.foreground
                return control.checked ? Theme.palette.accentForeground : Theme.palette.foreground
            }

            Behavior on x {
                NumberAnimation { duration: Theme.animation("fast").duration; easing.type: Easing.InOutQuad }
            }
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        text: control.text
        font: control.font
        color: control.enabled ? Theme.palette.foreground : Theme.palette.foreground
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
