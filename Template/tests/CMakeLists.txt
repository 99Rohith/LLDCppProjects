# Find GTest
find_package(GTest REQUIRED)
include(GoogleTest)

# Collect all test source files automatically
file(GLOB_RECURSE TEST_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

# Create test executable
add_executable(runTests ${TEST_FILES})
target_link_libraries(runTests PRIVATE project_lib ${GTEST_LIBRARIES} pthread)

# Register with CTest automatically
gtest_discover_tests(runTests)
