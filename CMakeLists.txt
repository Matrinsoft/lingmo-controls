cmake_minimum_required(VERSION 3.21)
cmake_policy(SET CMP0077 NEW)
cmake_policy(SET CMP0092 NEW)
cmake_policy(SET CMP0128 NEW)
qt_policy(SET QTP0001 NEW)

project(LingmoControls
    VERSION 1.0.0
    DESCRIPTION "Lingmo Desktop - QML Controls Library"
    HOMEPAGE_URL "https://lingmo.org"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(GNUInstallDirs)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(LingmoCompilerSettings)
include(LingmoSanitizers)
include(LingmoPCH)

option(BUILD_TESTING "Build tests" ON)
option(LINGMO_ENABLE_SANITIZERS "Enable sanitizers" OFF)
option(LINGMO_ENABLE_UNITY_BUILD "Enable unity builds" OFF)
option(BUILD_EXAMPLES "Build example programs" OFF)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)
find_package(LingmoTheme REQUIRED)
find_package(Qt6 COMPONENTS Test QUIET)

add_subdirectory(src)

if(BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()

if(BUILD_TESTING AND Qt6Test_FOUND)
    enable_testing()
    add_subdirectory(tests)
endif()
