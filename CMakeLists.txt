cmake_minimum_required(VERSION 3.0.2)


# Enable symbols by default
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()

######################################################################
# Project definition
project(SfmlAPI)

######################################################################
# Profile build type

list(APPEND CMAKE_BUILD_TYPES Profile)
mark_as_advanced(
    CMAKE_C_FLAGS_PROFILE
    CMAKE_CXX_FLAGS_PROFILE
    CMAKE_EXE_LINKER_FLAGS_PROFILE)

if(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_C_FLAGS_PROFILE "-pg"
        CACHE STRING "Profiling C flags")
    set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_C_FLAGS_PROFILE}"
        CACHE STRING "Profiling C++ flags")
    set(CMAKE_EXE_LINKER_FLAGS_PROFILE "-pg"
        CACHE STRING "Profiling linker flags")
endif()

if(MSVC)
    set(CMAKE_C_FLAGS_PROFILE "/MD /Zi /Ox /Gd"
        CACHE STRING "Profiling C flags")
    set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_C_FLAGS_PROFILE}"
        CACHE STRING "Profiling C++ flags")
    set(CMAKE_EXE_LINKER_FLAGS_PROFILE "/PROFILE /DEBUG"
        CACHE STRING "Profiling linker flags")
endif()


set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT SfmlAPI)

# SFML
add_subdirectory(vendor/SFML)
add_subdirectory(src)
set(BUILD_SFML_EXAMPLES FALSE)
cmake_policy(SET CMP0079 NEW)
target_link_libraries(SfmlAPI sfml-graphics sfml-window sfml-audio sfml-network)
cmake_policy(SET CMP0079 OLD)

#set_target_properties(SfmlAPI 
#    PROPERTIES IMPORTED_LINK_INTERFACE_LIBRARIES 
#    sfml-window
#    )