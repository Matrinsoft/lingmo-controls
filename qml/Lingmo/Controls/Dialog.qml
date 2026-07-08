import QtQuick
import QtQuick.Controls as T
import QtQuick.Layouts
import Lingmo.Theme

T.Dialog {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitHeaderWidth,
                            implicitFooterWidth)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding
                             + (implicitHeaderHeight > 0 ? implicitHeaderHeight + spacing : 0)
                             + (implicitFooterHeight > 0 ? implicitFooterHeight + spacing : 0))

    topPadding: Theme.metrics.spacingLarge
    bottomPadding: Theme.metrics.spacingLarge
    leftPadding: Theme.metrics.spacingLarge
    rightPadding: Theme.metrics.spacingLarge
    spacing: Theme.metrics.spacingMedium

    font: Theme.typography.fontByRole(Theme.typography.FontRole.Body)

    header: Label {
        text: control.title
        font: Theme.typography.fontByRole(Theme.typography.FontRole.Heading)
        color: Theme.palette.foreground
        topPadding: Theme.metrics.spacingMedium
        bottomPadding: Theme.metrics.spacingXXSmall
        leftPadding: control.leftPadding
        rightPadding: control.rightPadding
        visible: control.title.length > 0
    }

    footer: DialogButtonBox {
        topPadding: Theme.metrics.spacingMedium
        leftPadding: control.leftPadding
        rightPadding: control.rightPadding
        bottomPadding: control.bottomPadding
        spacing: Theme.metrics.spacingSmall

        buttonDelegate: Button {
            accent: highlighted
            flat: !highlighted
            font: control.font

            contentItem: Text {
                text: control.text
                font: parent.font
                color: {
                    if (!enabled)
                        return parent.accent ? Theme.palette.accentForeground : Theme.palette.foreground
                    if (parent.accent)
                        return Theme.palette.accentForeground
                    return Theme.palette.foreground
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: Theme.metrics.spacingXXLarge * 3
                implicitHeight: Theme.metrics.spacingLarge * 2.5

                radius: Theme.metrics.radiusSmall
                color: {
                    if (!control.enabled)
                        return control.accent ? Theme.palette.accent : Theme.palette.surface
                    if (control.pressed)
                        return control.accent ? Qt.darker(Theme.palette.accent, 1.15)
                                              : Qt.darker(Theme.palette.surface, 1.05)
                    if (control.hovered)
                        return control.accent ? Qt.lighter(Theme.palette.accent, 1.1)
                                              : Qt.lighter(Theme.palette.surface, 1.03)
                    if (control.accent)
                        return Theme.palette.accent
                    if (control.flat)
                        return "transparent"
                    return Theme.palette.surface
                }
                border {
                    width: control.accent || control.flat ? 0 : 1
                    color: control.visualFocus ? Theme.palette.accent : Theme.palette.border
                }
            }
        }

        alignment: Qt.AlignRight
    }

    background: Rectangle {
        radius: Theme.metrics.radiusMedium
        color: Theme.palette.background
        border {
            width: 1
            color: Theme.palette.border
        }
    }

    T.Overlay.modal: Rectangle {
        color: Qt.rgba(0, 0, 0, 0.3)

        Behavior on opacity {
            NumberAnimation { duration: Theme.animation("normal").duration }
        }
    }

    T.Overlay.modeless: Rectangle {
        color: Qt.rgba(0, 0, 0, 0.1)

        Behavior on opacity {
            NumberAnimation { duration: Theme.animation("normal").duration }
        }
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: Theme.animation("normal").duration
            easing.type: Easing.OutQuad
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: Theme.animation("fast").duration
            easing.type: Easing.InQuad
        }
    }
}
