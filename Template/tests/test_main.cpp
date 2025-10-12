#include <gtest/gtest.h>
#include "testing.h"

TEST(MainTest, Main) {
    EXPECT_EQ(_main_method(2), 3);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
