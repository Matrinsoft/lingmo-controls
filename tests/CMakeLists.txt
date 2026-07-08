find_package(Qt6 REQUIRED COMPONENTS QuickTest)

function(add_qml_test name)
    qt_add_qml_module(${name}
        URI Lingmo.Controls.tst.${name}
        VERSION 1.0
        QML_FILES ${name}.qml
        IMPORTS Lingmo.Controls
    )
    target_link_libraries(${name} PRIVATE Qt6::QuickTest)
    add_test(NAME ${name} COMMAND ${name})
endfunction()

add_qml_test(tst_QmlImport)
add_qml_test(tst_Button)
add_qml_test(tst_TextField)
add_qml_test(tst_ComboBox)
add_qml_test(tst_TabBar)
add_qml_test(tst_RangeSlider)
