cmake_minimum_required(VERSION 3.7)

project(star VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

################################### LASER ###################################
include_directories(../laser-plus-plus/include/)
file(GLOB LASER_SOURCES
    "../laser-plus-plus/src/formula/*.cpp"
        "../laser-plus-plus/src/formula/extended/*.cpp"
        "../laser-plus-plus/src/util/*.cpp"
        "../laser-plus-plus/src/rule/*.cpp"
        "../laser-plus-plus/src/rule/filter/*.cpp"
        "../laser-plus-plus/src/rule/math/*.cpp"
        "../laser-plus-plus/src/rule/math/evaluator/*.cpp"
        "../laser-plus-plus/src/core/*.cpp"
        "../laser-plus-plus/src/example/*.cpp"
        "../laser-plus-plus/src/service/*.cpp"
        )

find_package(Threads)

################################## SIMPLEAPP ##################################
include_directories(include/)
file(GLOB STAR_SOURCES
        "src/*.cpp"
    )

set(STAR_LASER_SOURCES ${LASER_SOURCES} ${STAR_SOURCES})
add_executable(star main.cpp ${STAR_LASER_SOURCES})
target_link_libraries(star ${CMAKE_THREAD_LIBS_INIT})

