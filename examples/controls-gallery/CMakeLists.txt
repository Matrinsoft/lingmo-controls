find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2 Widgets)
find_package(LingmoTheme REQUIRED)

set(sources
    main.cpp
)

qt_add_executable(controls-gallery ${sources})

target_link_libraries(controls-gallery
    PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
        Qt6::Widgets
        Lingmo::LingmoTheme
        LingmoControls
)

qt_import_qml_plugins(controls-gallery)
