######################################################################
# Creating SfmlAPI
######################################################################
file(GLOB src
    "*.hpp"
    "*.cpp"
)

add_library(SfmlAPI STATIC ${src})
target_link_libraries(SfmlAPI sfml-graphics sfml-system sfml-audio sfml-network)
add_definitions(-DEXPMODULE)

set_target_properties(SfmlAPI
    PROPERTIES
        CXX_STANDARD 11
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
)