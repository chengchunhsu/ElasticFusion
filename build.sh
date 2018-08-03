#!/bin/bash
use_ros

#Installing Pangolin
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build

cmake ../ -DAVFORMAT_INCLUDE_DIR="" -DCPP11_NO_BOOST=ON -DBUILD_PANGOLIN_LIBREALSENSE=OFF
make -j$(nproc) -l$(nproc)
cd ../..

#Up to date OpenNI2
git clone https://github.com/occipital/OpenNI2.git
cd OpenNI2
make -j$(nproc) -l$(nproc)
cd ..


# build_type is Debug/Release
BUILD_TYPE="Debug"

#Actually build ElasticFusion
cd ../Core
mkdir build
cd build
cmake ../src -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make -j$(nproc) -l$(nproc)

cd ../../GPUTest
mkdir build
cd build
cmake ../src -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make -j$(nproc) -l$(nproc)

cd ../../GUI
mkdir build
cd build
cmake ../src -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make -j$(nproc) -l$(nproc)
