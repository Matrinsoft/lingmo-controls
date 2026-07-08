# Lingmo.Controls API Reference

**Module URI:** `Lingmo.Controls`  
**Version:** 1.0  
**C++ Plugin:** `LingmoControls` (QML types provided by `LingmoControlsPlugin`)  
**Dependency:** `Lingmo.Theme` (all visual properties sourced from theme tokens)

---

## Controls Overview

| Control       | Base                    | Key Properties                        | Extras              |
|---------------|-------------------------|---------------------------------------|---------------------|
| Button        | QtQuick.Controls.Button  | `accent: bool`, `flat: bool`          | Full theme skin     |
| ToolButton    | QtQuick.Controls.Button  | same as Button                        | Compact default     |
| TextField     | QtQuick.Controls.TextField | —                                   | Themed input        |
| TextArea      | QtQuick.Controls.TextArea | —                                   | Multi-line input    |
| ComboBox      | QtQuick.Controls.ComboBox | —                                   | Dropdown selection  |
| SpinBox       | QtQuick.Controls.SpinBox  | —                                   | Numeric spinner     |
| CheckBox      | QtQuick.Controls.CheckBox | —                                   | Tri-state support   |
| RadioButton   | QtQuick.Controls.RadioButton | —                                 | Themed selection    |
| Switch        | QtQuick.Controls.Switch  | —                                     | Themed toggle       |
| Slider        | QtQuick.Controls.Slider  | —                                     | Horizontal/vertical |
| RangeSlider   | QtQuick.Controls.RangeSlider | —                                 | Dual-handle range   |
| Dial          | QtQuick.Controls.Dial    | —                                     | Rotary knob         |
| ProgressBar   | QtQuick.Controls.ProgressBar | —                                 | Determinate/indet.  |
| ScrollBar     | QtQuick.Controls.ScrollBar | —                                  | Themed scroll       |
| ScrollView    | QtQuick.Controls.ScrollView | —                                 | Scrollable viewport |
| TabBar        | QtQuick.Controls.TabBar  | —                                     | Tab navigation      |
| TabButton     | QtQuick.Controls.TabButton | —                                  | Individual tab      |
| Menu          | QtQuick.Controls.Menu    | —                                     | Themed popup menu   |
| ToolBar       | QtQuick.Controls.ToolBar  | —                                   | Toolbar container   |
| ToolTip       | QtQuick.Controls.ToolTip  | —                                   | Themed tooltip      |
| Dialog        | QtQuick.Controls.Dialog  | —                                     | Themed modal dialog |
| BusyIndicator | QtQuick.Controls.BusyIndicator | —                              | Animated spinner    |
| GroupBox      | QtQuick.Controls.GroupBox  | —                                   | Framed container    |
| DelayButton   | QtQuick.Controls.DelayButton | —                                | Hold-to-activate    |
| PageIndicator | QtQuick.Controls.PageIndicator | —                              | Page dots           |
| Tumbler       | QtQuick.Controls.Tumbler | —                                     | Wheel selector      |

All controls inherit the full API of their Qt Quick Controls base type. The Lingmo.Controls module only overrides visual appearance via `Lingmo.Theme` tokens.

---

## Button

```qml
Button {
    text: string
    accent: bool      // (default false) fills with Theme.palette.accent
    flat: bool        // (default false) transparent background until hover
    enabled: bool
}
```

**States:** default, hovered, pressed, disabled, focused  
**Behavior:** smooth color transitions via `Easing.InOutQuad` (fast speed)

---

## ToolButton

```qml
ToolButton {
    text: string
    accent: bool
    flat: bool
}
```

Identical to Button but with compact default sizing (square-ish aspect).

---

## TextField

```qml
TextField {
    text: string
    placeholderText: string
    enabled: bool
}
```

**States:** default, hovered, focused, disabled  
**Focus indicator:** 2px accent border; focused border animates via `ColorAnimation`

---

## CheckBox

```qml
CheckBox {
    text: string
    checked: bool
    tristate: bool
    checkState: Qt.Checked | Qt.Unchecked | Qt.PartiallyChecked
    enabled: bool
}
```

**Indicator:** filled accent when checked, checkmark drawn via rotated Rectangle, partial state shown as small filled square.

---

## RadioButton

```qml
RadioButton {
    text: string
    checked: bool
    enabled: bool
}
```

Circular indicator with accent fill when selected.

---

## Switch

```qml
Switch {
    text: string
    checked: bool
    enabled: bool
}
```

Horizontal track + circular handle, accent colored when on.

---

## Slider

```qml
Slider {
    from: real
    to: real
    value: real
    orientation: Qt.Horizontal | Qt.Vertical
    enabled: bool
}
```

Track with accent fill to position; circular handle with accent color.

---

## ProgressBar

```qml
ProgressBar {
    from: real
    to: real
    value: real
    indeterminate: bool
}
```

Determinate: accent fill grows left-to-right.  
Indeterminate: animated bar sweeping across the track.

---

## ScrollBar

```qml
ScrollBar {
    size: real      // 0.0–1.0, proportion visible
    position: real  // 0.0–1.0, scroll offset
    orientation: Qt.Horizontal | Qt.Vertical
    policy: ScrollBar.AsNeeded | ScrollBar.AlwaysOn | ScrollBar.AlwaysOff
}
```

Thin bar with accent-colored handle that fades in/out based on policy.

---

## TextArea

```qml
TextArea {
    text: string
    placeholderText: string
    enabled: bool
}
```

Multi-line text input. Same theming as TextField with scrollable content area.

---

## ComboBox

```qml
ComboBox {
    model: [string list]
    currentIndex: int
    displayText: string
    enabled: bool
}
```

Dropdown selection with themed popup list. Items highlight with accent alpha on hover.

---

## SpinBox

```qml
SpinBox {
    from: real
    to: real
    value: real
    stepSize: real
    editable: bool
}
```

Numeric spinner with up/down indicator buttons. Themed increment/decrement arrows.

---

## TabBar / TabButton

```qml
TabBar {
    TabButton { text: string; checked: bool }
}
```

TabBar provides a horizontal tab strip with bottom border. TabButton shows accent bottom bar when active, with smooth width/color transitions.

---

## RangeSlider

```qml
RangeSlider {
    from: real; to: real
    first.value: real
    second.value: real
    orientation: Qt.Horizontal | Qt.Vertical
}
```

Dual-handle slider for range selection. Accent fill between handles. Each handle independently interactive.

---

## Dial

```qml
Dial {
    from: real; to: real
    value: real
    stepSize: real
}
```

Rotary knob control with circular track and tick marks. Accent-colored handle pointer.

---

## ToolTip

```qml
ToolTip {
    text: string
    visible: bool
    delay: int
    timeout: int
}
```

Themed tooltip with foreground-colored background (90% opacity). Fade-in/out animation.

---

## ToolBar

```qml
ToolBar {
    // Container for ToolButton and other controls
    RowLayout { Button {} ToolButton {} }
}
```

Toolbar container with surface background and bottom border. Defaults to compact padding.

---

## ScrollView

```qml
ScrollView {
    // Wraps scrollable content with themed ScrollBars
    TextArea { ... }
}
```

Scrollable viewport with themed vertical and horizontal ScrollBars automatically attached.

---

## BusyIndicator

```qml
BusyIndicator {
    running: bool
}
```

Animated spinner with 12 radiating accent-colored dots. Sequential opacity fade animation when running.

---

## GroupBox

```qml
GroupBox {
    title: string
    // Content items placed inside
    ColumnLayout { ... }
}
```

Framed container with border and top-aligned title label.

---

## DelayButton

```qml
DelayButton {
    text: string
    progress: real  // 0.0–1.0
    onActivated: {}
}
```

Accent-filled button with progress bar. Must be held until progress completes to activate.

---

## PageIndicator

```qml
PageIndicator {
    count: int
    currentIndex: int
}
```

Row of pill-shaped dots. Active dot is accent-colored and wider; inactive dots are semi-transparent. Smooth width/color transitions.

---

## Tumbler

```qml
Tumbler {
    model: [string list]
    currentIndex: int
    visibleItemCount: int
}
```

Wheel/column selector with vertical scrolling. Current item fully opaque, others fade with distance. Themed background.

---

## Menu

```qml
Menu {
    title: string

    MenuItem { text: string; checkable: bool; checked: bool }
    MenuSeparator {}
}
```

Pop-up menu with rounded background, hover highlight via accent alpha, arrow indicators for submenus.

---

## Dialog

```qml
Dialog {
    title: string
    standardButtons: Dialog.Ok | Dialog.Cancel | ...  (or custom buttons)
    modal: bool

    // header and footer are themed automatically
    contentItem: Item { /* your content */ }
}
```

Modal dialog with header title, footer button bar, background overlay.  
**Animations:** fade-in on enter (300ms OutQuad), fade-out on exit (200ms InQuad).  
**Overlay:** semi-transparent black (modal: 30%, modeless: 10%).

---

## C++ Integration

### Initialization

```cpp
#include <LingmoControls/LingmoControls.h>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    LingmoControls::initialize();
    // ...
}
```

### CMake

```cmake
find_package(LingmoControls REQUIRED)
target_link_libraries(myapp PRIVATE LingmoControls)
```

---

## Versioning

- CMake: `LingmoControlsConfig.cmake` + `LingmoControlsConfigVersion.cmake`
- Header: `LingmoControlsVersion.h` (LINGMOCONTROLS_VERSION_* macros)
- QML module: version 1.0
