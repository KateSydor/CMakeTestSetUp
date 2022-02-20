#!/bin/bash
cd ..

echo "Project name - " $1

# create structure
echo "Start creating folder structure for $1"
mkdir -p $1/{build,lib,src,test}
echo "Structure created"

# download google test framework
echo "Downloading test framework to $1/lib"
cd  $1/lib
git clone https://github.com/google/googletest/
echo "Download finished"

cd ..
echo "Copying files to: "
pwd
cp ../BaseTestProject/CMakeLists.txt .
# copy source files
cp ../BaseTestProject/src/CMakeLists.txt src
cp ../BaseTestProject/src/main.cpp src
# copy test files
cp ../BaseTestProject/test/main.cpp test
cp ../BaseTestProject/test/CMakeLists.txt test
echo "Coping finished"

cd build
echo "Compiling ..."
pwd
# compile
cmake .. -DCMAKE_BUILD_TYPE=Debug -G "Unix Makefiles"
make all
echo "Compiled !!!"