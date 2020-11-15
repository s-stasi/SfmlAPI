file(GLOB src
    "*.hpp"
    "*.cpp"
)

add_library(SfmlAPI STATIC ${src})

include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/vendor/SFML/include)
add_definitions(-DEXPMODULE)