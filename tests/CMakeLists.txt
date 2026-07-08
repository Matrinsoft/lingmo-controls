find_package(Qt6 REQUIRED COMPONENTS QuickTest)

qt_add_executable(tst_controls
    main.cpp
)
target_link_libraries(tst_controls PRIVATE Qt6::QuickTest)
target_compile_definitions(tst_controls PRIVATE
    QUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
)
add_test(NAME tst_controls COMMAND tst_controls)
