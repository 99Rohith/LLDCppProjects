# Collect all source files automatically
file(GLOB_RECURSE SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

# Create library for all source files
add_library(project_lib ${SRC_FILES})
target_include_directories(project_lib PUBLIC ${CMAKE_SOURCE_DIR}/include)

# If there's a main.cpp file, create a main executable automatically
file(GLOB MAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")
if(MAIN_FILE)
    add_executable(Template ${MAIN_FILE})
    target_link_libraries(Template PRIVATE project_lib)
endif()
