cmake_minimum_required(VERSION 3.12)
project(Tests VERSION 1.0.0 LANGUAGES CXX)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

set (HEADER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

set (HEADERS
    ${HEADER_DIR}/MockUserRepository.h
)

set (SOURCES
    ${SOURCE_DIR}/UserServiceTests.cpp
)

## add executables
add_executable(${PROJECT_NAME}
    ${SOURCES}
    ${HEADERS}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        $<BUILD_INTERFACE:${SOURCE_DIR}>
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC 
        model
        repository
        service
        gtest_main
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        CXX_EXTENSIONS OFF
        CXX_STANDARD_REQUIRED ON
)

include(GoogleTest)
