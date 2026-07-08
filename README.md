# Lingmo Controls

Qt Quick QML controls module for Lingmo Desktop.

All visual properties are driven by `Lingmo.Theme` design tokens.

## Import

```qml
import Lingmo.Controls
```

## Dependencies

- Qt 6 (Core, Gui, Qml, Quick, QuickControls2)
- Lingmo Theme (>= 1.0)

## Building

```bash
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build
ctest --test-dir build
```

## Controls

| Control | Description |
|---------|-------------|
| Button | Push button with accent variant |
| ToolButton | Flat tool button for toolbars |
| TextField | Single-line text input |
| CheckBox | Check box with tri-state |
| RadioButton | Radio button |
| Switch | Toggle switch |
| Slider | Value slider (horizontal/vertical) |
| ProgressBar | Progress indicator |
| ScrollBar | Scroll bar |
| Menu | Popup menu |
| Dialog | Modal dialog with standard buttons |

## License

GPL-2.0-or-later
