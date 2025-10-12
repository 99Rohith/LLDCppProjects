#!/bin/bash
set -e

mkdir -p build
cd build

echo "🔧 Configuring..."
cmake ..

echo "🚀 Building..."
cmake --build .

echo "🏃 Running main..."
./src/Template

echo "🧪 Running tests..."
ctest --output-on-failure || ./tests/runTests
