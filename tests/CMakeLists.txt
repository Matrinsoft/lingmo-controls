find_package(Qt6 REQUIRED COMPONENTS QuickTest)

function(add_qml_test name)
    qt_add_executable(${name}
        ${name}.qml
    )
    target_link_libraries(${name} PRIVATE Qt6::QuickTest)
    add_test(NAME ${name} COMMAND ${name} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
endfunction()

add_qml_test(tst_QmlImport)
add_qml_test(tst_Button)
add_qml_test(tst_TextField)
add_qml_test(tst_ComboBox)
add_qml_test(tst_TabBar)
add_qml_test(tst_RangeSlider)
