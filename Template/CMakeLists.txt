cmake_minimum_required(VERSION 3.10)
project(Template)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

enable_testing()

add_subdirectory(src)
add_subdirectory(tests)
