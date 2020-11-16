cmake_minimum_required(VERSION 3.0.2)
include(ExternalProject)

######################################################################
# Enable symbols by default
######################################################################
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()

######################################################################
# Project definition
######################################################################
project(SfmlAPI)

######################################################################
# Profile build type
######################################################################
list(APPEND CMAKE_BUILD_TYPES Profile)
mark_as_advanced(
    CMAKE_C_FLAGS_PROFILE
    CMAKE_CXX_FLAGS_PROFILE
    CMAKE_EXE_LINKER_FLAGS_PROFILE)

if(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_C_FLAGS_PROFILE "-pg"
        CACHE STRING "Profiling C flags")
    set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_C_FLAGS_PROFILE} -std=gnu++11"
        CACHE STRING "Profiling C++ flags")
    set(CMAKE_EXE_LINKER_FLAGS_PROFILE "-pg"
        CACHE STRING "Profiling linker flags")
endif()

if(MSVC)
    set(CMAKE_C_FLAGS_PROFILE "/MD /Zi /Ox /Gd"
        CACHE STRING "Profiling C flags")
    set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_C_FLAGS_PROFILE} -std=c++11"
        CACHE STRING "Profiling C++ flags")
    set(CMAKE_EXE_LINKER_FLAGS_PROFILE "/PROFILE /DEBUG"
        CACHE STRING "Profiling linker flags")
endif()

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT SfmlAPI)

######################################################################
# SFML
######################################################################
if(UNIX)
    message(STATUS ">>> Linux")
    set(SFML_STATIC_LIBRARIES TRUE)
    find_package(SFML 2.5 COMPONENTS graphics system audio network REQUIRED)

    if(SFML_FOUND)

        message(STATUS ">>> Found SFML")
        add_subdirectory(src)

    else(NOT SFML_FOUND)

        message(STATUS ">>> SFML not found, I'll download and compile it")
        set(sfml_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/vendor/sfml")
        set(sfml_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bin")
        set(sfml_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${sfml_INSTALL_DIR} 
            -DBUILD_SHARED_LIBS:BOOL=OFF
            -DENABLE_STATIC_RUNTIME:BOOL=OFF
            -DBUILD_EXAMPLES:BOOL=OFF)
        
        message("sfml_PREFIX='${sfml_PREFIX}'")
        message("sfml_INSTALL_DIR='${sfml_INSTALL_DIR}'")
        message("sfml_CMAKE_ARGS='${sfml_CMAKE_ARGS}'")
        message("GIT_EXECUTABLE='${GIT_EXECUTABLE}'")
        
        ExternalProject_Add(sfml
            PREFIX ${sfml_PREFIX}
            GIT_REPOSITORY https://github.com/LaurentGomila/SFML.git
            INSTALL_DIR ${sfml_INSTALL_DIR}
            CMAKE_ARGS ${sfml_CMAKE_ARGS}
        )
        include_directories("vendor/sfml/include")
        add_subdirectory(src)

    endif()
    
else(WIN32)
    message(STATUS ">>> SFML not found, I'll download and compile it")
    set(sfml_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/vendor/sfml")
    set(sfml_INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bin")
    set(sfml_CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${sfml_INSTALL_DIR} 
        -DBUILD_SHARED_LIBS:BOOL=OFF
        -DENABLE_STATIC_RUNTIME:BOOL=OFF
        -DBUILD_EXAMPLES:BOOL=OFF)
    
    message("sfml_PREFIX='${sfml_PREFIX}'")
    message("sfml_INSTALL_DIR='${sfml_INSTALL_DIR}'")
    message("sfml_CMAKE_ARGS='${sfml_CMAKE_ARGS}'")
    message("GIT_EXECUTABLE='${GIT_EXECUTABLE}'")
    
    ExternalProject_Add(sfml
        PREFIX ${sfml_PREFIX}
        GIT_REPOSITORY https://github.com/LaurentGomila/SFML.git
        INSTALL_DIR ${sfml_INSTALL_DIR}
        CMAKE_ARGS ${sfml_CMAKE_ARGS}
    )
    include_directories("vendor/sfml/include")
    add_subdirectory(src)
endif()

