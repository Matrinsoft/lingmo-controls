import QtQuick
import QtQuick.Controls as T
import QtQuick.Controls.impl as Impl
import Lingmo.Theme

T.TabBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: 0
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    font: Theme.typography.fontByRole(Theme.typography.FontRole.UI)

    background: Rectangle {
        implicitHeight: Theme.metrics.spacingLarge * 2.5
        color: "transparent"

        Rectangle {
            x: 0
            y: parent.height - 1
            width: parent.width
            height: 1
            color: Theme.palette.border
        }
    }

    contentItem: ListView {
        model: control.contentModel
        currentIndex: control.currentIndex
        orientation: ListView.Horizontal
        spacing: 0
        interactive: false

        delegate: TabButton {
            width: implicitWidth
            height: control.height
        }
    }
}
