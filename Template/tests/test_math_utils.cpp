#include <gtest/gtest.h>
#include "math_utils.h"

TEST(MathUtilsTest, Add) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(MathUtilsTest, Subtract) {
    EXPECT_EQ(subtract(5, 3), 2);
}
