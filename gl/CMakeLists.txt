cmake_minimum_required(VERSION 2.8.11)

option(PROJECT_NAME "project name" glcv)

project(${PROJECT_NAME})
set(CMAKE_CXX_STANDARD 11)
if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()
set(CMAKE_CXX_FLAGS "-O3")

include_directories(./)

find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
set(DEPS ${OPENGL_LIBRARIES})
list(APPEND DEPS ${GLUT_LIBRARY})

find_package(GLEW)
if (GLEW_FOUND)
  include_directories(${GLEW_INCLUDE_DIRS})
  list(APPEND DEPS GLEW::GLEW)
endif()

find_package(glfw3)
if (glfw_FOUND)
list(APPEND DEPS glfw)
endif()

find_package(OpenCV REQUIRED)
if(OPENCV_FOUND)
  list(APPEND DEPS ${OpenCV_LIBS})
endif()

find_package(assimp REQUIRED)
if (assimp_FOUND)
    link_directories(${ASSIMP_LIBRARY_DIRS})
    include_directories(${ASSIMP_INCLUDE_DIRS})
    list(APPEND DEPS ${ASSIMP_LIBRARIES})
endif()

add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_link_libraries(${PROJECT_NAME} ${DEPS})

file(COPY shaders DESTINATION ${CMAKE_BINARY_DIR})
file(COPY cube.obj DESTINATION ${CMAKE_BINARY_DIR})