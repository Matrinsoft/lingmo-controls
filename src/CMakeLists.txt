set(module_name LingmoControls)

set(public_headers
    include/LingmoControls/LingmoControls.h
    include/LingmoControls/LingmoControlsExport.h.in
    include/LingmoControls/LingmoControlsVersion.h.in
)

set(sources
    src/LingmoControls/LingmoControlsPlugin.cpp
)

qt_add_qml_module(${module_name}
    URI Lingmo.Controls
    VERSION 1.0
    QML_FILES
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/BusyIndicator.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Button.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/CheckBox.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ComboBox.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/DelayButton.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Dial.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Dialog.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/GroupBox.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Menu.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/PageIndicator.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ProgressBar.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/RadioButton.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/RangeSlider.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ScrollBar.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ScrollView.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Slider.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/SpinBox.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Switch.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/TabBar.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/TabButton.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/TextArea.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/TextField.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ToolBar.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ToolButton.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/ToolTip.qml
        ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/Tumbler.qml
    SOURCES
        ${sources}
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/qml/Lingmo/Controls"
    INSTALL_DIRECTORY "${CMAKE_INSTALL_LIBDIR}/qt6/qml/Lingmo/Controls"
    TARGET ${module_name}
)

target_include_directories(${module_name}
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

target_link_libraries(${module_name}
    PUBLIC
        Lingmo::Theme
    PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
)

set_target_properties(${module_name} PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN ON
    AUTOMOC ON
    AUTOMOC_MOC_NAMESPACE Lingmo
    DEFINE_SYMBOL LINGMOCONTROLS_LIBRARY
    INSTALL_COMPONENT runtime
)

configure_file(
    "${CMAKE_SOURCE_DIR}/include/LingmoControls/LingmoControlsExport.h.in"
    "${CMAKE_BINARY_DIR}/include/LingmoControls/LingmoControlsExport.h"
)

configure_file(
    "${CMAKE_SOURCE_DIR}/include/LingmoControls/LingmoControlsVersion.h.in"
    "${CMAKE_BINARY_DIR}/include/LingmoControls/LingmoControlsVersion.h"
)

install(
    FILES
        "${CMAKE_BINARY_DIR}/include/LingmoControls/LingmoControlsExport.h"
        "${CMAKE_BINARY_DIR}/include/LingmoControls/LingmoControlsVersion.h"
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/LingmoControls
    COMPONENT devel
)

install(
    DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING
        PATTERN "*.h"
    COMPONENT devel
)

install(
    EXPORT ${module_name}Targets
    FILE ${module_name}Targets.cmake
    NAMESPACE Lingmo::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${module_name}
    COMPONENT devel
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    "${CMAKE_SOURCE_DIR}/cmake/LingmoControlsConfig.cmake.in"
    "${CMAKE_BINARY_DIR}/LingmoControlsConfig.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${module_name}
)

write_basic_package_version_file(
    "${CMAKE_BINARY_DIR}/LingmoControlsConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

install(
    FILES
        "${CMAKE_BINARY_DIR}/LingmoControlsConfig.cmake"
        "${CMAKE_BINARY_DIR}/LingmoControlsConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${module_name}
    COMPONENT devel
)
