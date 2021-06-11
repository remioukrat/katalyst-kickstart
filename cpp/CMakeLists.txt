cmake_minimum_required(VERSION 3.12)

project(katalyst VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

enable_testing()
include(exporter)

add_subdirectory(Application)
add_subdirectory(Tests)