import QtQuick
import QtQuick.Controls as T
import Lingmo.Theme

T.ScrollView {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: 0
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    ScrollBar.horizontal: ScrollBar {
        policy: control.ScrollBar.horizontal.policy
    }

    ScrollBar.vertical: ScrollBar {
        policy: control.ScrollBar.vertical.policy
    }
}
