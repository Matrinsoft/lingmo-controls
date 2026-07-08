import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.Tumbler {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: 0
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    delegate: Text {
        text: modelData
        font: control.font
        color: Tumbler.disabled ? Theme.palette.foreground
               : Tumbler.currentIndex === index ? Theme.palette.foreground
               : Qt.rgba(Theme.palette.foreground.r, Theme.palette.foreground.g,
                         Theme.palette.foreground.b, 0.4)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.visibleItemCount / 2)
    }

    contentItem: PathView {
        id: pathView
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: pathView.width / 2
            startY: -pathView.height / 2
            PathLine {
                x: pathView.width / 2
                y: pathView.height * 1.5
            }
        }
        pathItemCount: control.visibleItemCount
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange
    }

    background: Rectangle {
        implicitWidth: Theme.metrics.spacingXXLarge * 2
        implicitHeight: Theme.metrics.spacingLarge * 5

        color: Theme.palette.background
        border {
            width: 1
            color: Theme.palette.border
        }

        Rectangle {
            y: (parent.height - height) / 2
            width: parent.width
            height: Theme.metrics.spacingLarge * 1.5
            color: "transparent"
            border {
                width: 0
            }
        }
    }
}
