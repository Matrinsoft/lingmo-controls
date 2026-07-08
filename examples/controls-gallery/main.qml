import QtQuick
import QtQuick.Controls as T
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.impl as Impl
import Lingmo.Controls
import Lingmo.Theme

Window {
    id: window
    width: 900
    height: 700
    minimumWidth: 600
    minimumHeight: 500
    visible: true
    title: "Lingmo Controls Gallery"

    color: Theme.palette.background

    property bool darkMode: false

    header: ToolBar {
        background: Rectangle {
            color: Theme.palette.surface
            border.color: Theme.palette.border
            border.width: 1
        }

        RowLayout {
            anchors.fill: parent
            anchors.margins: Theme.metrics.spacingSmall

            Label {
                text: "Lingmo Controls Gallery"
                font: Theme.typography.fontByRole(Theme.typography.FontRole.Heading)
                color: Theme.palette.foreground
                Layout.fillWidth: true
            }

            Button {
                text: darkMode ? "☀ Light" : "☾ Dark"
                accent: true
                onClicked: {
                    darkMode = !darkMode
                    Theme.effectiveTheme = darkMode ? 1 : 0
                }
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        anchors.margins: Theme.metrics.spacingMedium
        contentWidth: availableWidth
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: Theme.metrics.spacingLarge

            // --- Buttons ---
            GroupBox {
                title: "Buttons"
                Layout.fillWidth: true

                Flow {
                    width: parent.width
                    spacing: Theme.metrics.spacingMedium

                    Button { text: "Default" }
                    Button { text: "Accent"; accent: true }
                    Button { text: "Flat"; flat: true }
                    Button { text: "Disabled"; enabled: false }
                    Button { text: "Accent+Flat"; accent: true; flat: true }
                }
            }

            // --- Tool Buttons ---
            GroupBox {
                title: "Tool Buttons"
                Layout.fillWidth: true

                Flow {
                    width: parent.width
                    spacing: Theme.metrics.spacingMedium

                    ToolButton { text: "🔍" }
                    ToolButton { text: "✏"; accent: true }
                    ToolButton { text: "🗑"; enabled: false }
                }
            }

            // --- Text Fields ---
            GroupBox {
                title: "Text Fields"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingSmall

                    TextField { placeholderText: "Default field"; Layout.fillWidth: true }
                    TextField { text: "Pre-filled"; Layout.fillWidth: true }
                    TextField { placeholderText: "Disabled"; enabled: false; Layout.fillWidth: true }
                }
            }

            // --- TextArea ---
            GroupBox {
                title: "TextArea"
                Layout.fillWidth: true

                TextArea {
                    placeholderText: "Multi-line text input..."
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                }
            }

            // --- ComboBox & SpinBox ---
            GroupBox {
                title: "ComboBox & SpinBox"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingSmall

                    ComboBox {
                        model: ["Option A", "Option B", "Option C", "Option D"]
                        Layout.fillWidth: true
                    }

                    ComboBox {
                        model: ["Disabled"]
                        enabled: false
                        Layout.fillWidth: true
                    }

                    SpinBox {
                        from: 0; to: 100; value: 42
                        Layout.fillWidth: true
                    }

                    SpinBox {
                        from: 0; to: 100; editable: false
                        Layout.fillWidth: true
                    }
                }
            }

            // --- CheckBox, RadioButton, Switch ---
            GroupBox {
                title: "Selection Controls"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingSmall

                    CheckBox { text: "CheckBox unchecked" }
                    CheckBox { text: "CheckBox checked"; checked: true }
                    CheckBox { text: "CheckBox tri-state"; tristate: true; checkState: Qt.PartiallyChecked }
                    CheckBox { text: "Disabled"; enabled: false }

                    Item { height: Theme.metrics.spacingSmall; width: 1 }

                    RadioButton { text: "Radio 1"; checked: true }
                    RadioButton { text: "Radio 2" }
                    RadioButton { text: "Radio disabled"; enabled: false }

                    Item { height: Theme.metrics.spacingSmall; width: 1 }

                    Switch { text: "Switch off" }
                    Switch { text: "Switch on"; checked: true }
                    Switch { text: "Switch disabled"; enabled: false }
                }
            }

            // --- TabBar + TabButton ---
            GroupBox {
                title: "TabBar"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingSmall

                    TabBar {
                        id: tabBar
                        Layout.fillWidth: true

                        TabButton { text: "General" }
                        TabButton { text: "Appearance" }
                        TabButton { text: "Advanced" }
                    }

                    StackLayout {
                        currentIndex: tabBar.currentIndex
                        Layout.fillWidth: true
                        Layout.preferredHeight: 80

                        Item { Label { text: "General settings"; color: Theme.palette.foreground; anchors.centerIn: parent } }
                        Item { Label { text: "Appearance settings"; color: Theme.palette.foreground; anchors.centerIn: parent } }
                        Item { Label { text: "Advanced settings"; color: Theme.palette.foreground; anchors.centerIn: parent } }
                    }
                }
            }

            // --- RangeSlider ---
            GroupBox {
                title: "RangeSlider"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingMedium

                    RangeSlider {
                        from: 0; to: 100
                        first.value: 25
                        second.value: 75
                        Layout.fillWidth: true
                    }

                    RangeSlider {
                        orientation: Qt.Vertical
                        from: 0; to: 100
                        first.value: 10
                        second.value: 90
                        implicitHeight: 120
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            // --- Dial ---
            GroupBox {
                title: "Dial"
                Layout.fillWidth: true

                Flow {
                    width: parent.width
                    spacing: Theme.metrics.spacingLarge

                    Dial {
                        from: 0; to: 100; value: 65
                        implicitWidth: 120; implicitHeight: 120
                    }

                    Dial {
                        from: 0; to: 100; value: 30
                        implicitWidth: 120; implicitHeight: 120
                        enabled: false
                    }
                }
            }

            // --- BusyIndicator & DelayButton ---
            GroupBox {
                title: "BusyIndicator & DelayButton"
                Layout.fillWidth: true

                Flow {
                    width: parent.width
                    spacing: Theme.metrics.spacingLarge

                    BusyIndicator { running: true; implicitWidth: 64; implicitHeight: 64 }
                    BusyIndicator { running: false; implicitWidth: 64; implicitHeight: 64 }

                    DelayButton {
                        text: "Hold to confirm"
                        implicitWidth: 160
                        onActivated: console.log("Confirmed!")
                    }
                }
            }

            // --- PageIndicator & GroupBox ---
            GroupBox {
                title: "PageIndicator"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingMedium

                    PageIndicator {
                        count: 5
                        currentIndex: 2
                        Layout.alignment: Qt.AlignHCenter
                    }

                    PageIndicator {
                        count: 3
                        currentIndex: 0
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            // --- Tumbler ---
            GroupBox {
                title: "Tumbler"
                Layout.fillWidth: true

                Tumbler {
                    model: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                    currentIndex: 2
                    visibleItemCount: 3
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            // --- ToolTip ---
            GroupBox {
                title: "ToolTip"
                Layout.fillWidth: true

                Button {
                    text: "Hover me"

                    ToolTip {
                        text: "This is a tooltip"
                        visible: parent.hovered
                        delay: 500
                    }
                }
            }

            // --- Slider & ProgressBar ---
            GroupBox {
                title: "Slider & Progress"
                Layout.fillWidth: true

                ColumnLayout {
                    width: parent.width
                    spacing: Theme.metrics.spacingMedium

                    Slider {
                        from: 0; to: 100; value: 65
                        Layout.fillWidth: true
                    }

                    Slider {
                        orientation: Qt.Vertical
                        from: 0; to: 100; value: 40
                        implicitHeight: 120
                        Layout.alignment: Qt.AlignHCenter
                    }

                    ProgressBar {
                        from: 0; to: 100; value: 72
                        Layout.fillWidth: true
                    }

                    ProgressBar {
                        indeterminate: true
                        Layout.fillWidth: true
                    }
                }
            }

            // --- ScrollBar ---
            GroupBox {
                title: "ScrollBar"
                Layout.fillWidth: true

                RowLayout {
                    width: parent.width
                    height: 100
                    spacing: Theme.metrics.spacingMedium

                    ScrollBar {
                        orientation: Qt.Vertical
                        size: 0.3
                        position: 0.5
                        Layout.fillHeight: true
                    }

                    Item { Layout.fillWidth: true }
                }
            }

            // --- Menu ---
            GroupBox {
                title: "Menu"
                Layout.fillWidth: true

                Button {
                    text: "Open Menu"

                    onClicked: {
                        menu.popup(this, 0, height)
                    }

                    Menu {
                        id: menu
                        title: "File"

                        MenuItem { text: "New" }
                        MenuItem { text: "Open" }
                        MenuItem { text: "Save"; enabled: false }
                        MenuSeparator {}
                        MenuItem { text: "Quit"; checkable: true }
                    }
                }
            }

            // --- Dialog ---
            GroupBox {
                title: "Dialog"
                Layout.fillWidth: true

                Button {
                    text: "Open Dialog"

                    onClicked: dialog.open()

                    Dialog {
                        id: dialog
                        title: "Confirm"
                        standardButtons: Dialog.Ok | Dialog.Cancel
                        modal: true
                        anchors.centerIn: Overlay.overlay

                        contentItem: Label {
                            text: "Are you sure you want to proceed?"
                            color: Theme.palette.foreground
                        }
                    }
                }
            }

            Item { height: Theme.metrics.spacingLarge; width: 1 }
        }
    }
}
