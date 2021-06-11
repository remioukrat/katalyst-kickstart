cmake_minimum_required(VERSION 3.12)
project(Model VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)

set (HEADER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set (ALIAS_NAME model)

set (HEADERS
    ${HEADER_DIR}/User.h
)

add_library(${ALIAS_NAME} INTERFACE)
add_library(${PROJECT_NAME}::${ALIAS_NAME} ALIAS ${ALIAS_NAME})

target_compile_features(${ALIAS_NAME} 
  INTERFACE 
    cxx_auto_type
)

target_include_directories(${ALIAS_NAME}
    INTERFACE
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${HEADER_DIR}>
)

if (WIN32)
  add_custom_target(${PROJECT_NAME} SOURCES ${HEADERS})
endif(WIN32)

install_and_export_library(${PROJECT_NAME} ${ALIAS_NAME})