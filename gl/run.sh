#/bin/bash
if [ ! -d build ]; then
    mkdir build
fi
cd build

#DEMO_NAME=glcv
#DEMO_NAME=gltest
#DEMO_NAME=solar
DEMO_NAME=gl3d

cmake .. -DPROJECT_NAME=${DEMO_NAME}
make -j4
./${DEMO_NAME} cube.obj