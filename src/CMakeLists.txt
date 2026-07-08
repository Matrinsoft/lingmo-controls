set(CMAKE_AUTOMOC ON)
qt_policy(SET QTP0001 NEW)

set(module_name LingmoControls)

set(public_headers
    include/LingmoControls/LingmoControls.h
    include/LingmoControls/LingmoControlsExport.h.in
    include/LingmoControls/LingmoControlsVersion.h.in
)

set(sources
    src/LingmoControls/LingmoControlsPlugin.cpp
)

set(qml_dir ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls)
set(qml_files
    ${qml_dir}/BusyIndicator.qml
    ${qml_dir}/Button.qml
    ${qml_dir}/CheckBox.qml
    ${qml_dir}/ComboBox.qml
    ${qml_dir}/DelayButton.qml
    ${qml_dir}/Dial.qml
    ${qml_dir}/Dialog.qml
    ${qml_dir}/GroupBox.qml
    ${qml_dir}/Menu.qml
    ${qml_dir}/PageIndicator.qml
    ${qml_dir}/ProgressBar.qml
    ${qml_dir}/RadioButton.qml
    ${qml_dir}/RangeSlider.qml
    ${qml_dir}/ScrollBar.qml
    ${qml_dir}/ScrollView.qml
    ${qml_dir}/Slider.qml
    ${qml_dir}/SpinBox.qml
    ${qml_dir}/Switch.qml
    ${qml_dir}/TabBar.qml
    ${qml_dir}/TabButton.qml
    ${qml_dir}/TextArea.qml
    ${qml_dir}/TextField.qml
    ${qml_dir}/ToolBar.qml
    ${qml_dir}/ToolButton.qml
    ${qml_dir}/ToolTip.qml
    ${qml_dir}/Tumbler.qml
)

foreach(f ${qml_files})
    get_filename_component(name ${f} NAME)
    set_source_files_properties(${f} PROPERTIES QT_RESOURCE_ALIAS ${name})
endforeach()

qt_add_qml_module(${module_name}
    URI Lingmo.Controls
    VERSION 1.0
    QML_FILES ${qml_files}
    SOURCES
        ${sources}
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
    AUTOMOC_MOC_NAMESPACE Lingmo
    DEFINE_SYMBOL LINGMOCONTROLS_LIBRARY
)

install(TARGETS ${module_name}
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/Lingmo/Controls
    COMPONENT runtime
)

install(
    FILES ${CMAKE_SOURCE_DIR}/qml/Lingmo/Controls/qmldir
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/Lingmo/Controls
    COMPONENT runtime
)

install(
    FILES
        ${CMAKE_SOURCE_DIR}/include/LingmoControls/LingmoControls.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/LingmoControls
    COMPONENT devel
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
