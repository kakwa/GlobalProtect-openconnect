cmake_minimum_required(VERSION 3.1.0)

project(QtSignals LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core)

add_library(QtSignals STATIC sigwatch.cpp)
target_include_directories(QtSignals INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(QtSignals Qt6::Core)
