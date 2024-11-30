# CMake 最低版本号要求
cmake_minimum_required (VERSION 3.2)

# message( [STATUS|WARNING|AUTHOR_WARNING|FATAL_ERROR|SEND_ERROR] "message to display" ...)
message(STATUS "cmake start!")
message(STATUS "SW_VERSION = ${SW_VERSION}")


#项目名称, 参数值是 main, 该命令表示项目的名称是 main
project(main)

#把当前目录(./)下所有源代码文件和头文件加入变量SRC_LIST
aux_source_directory(. SRC_LIST)

# 显示指定使用的C编译器 
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

# 指定生成目标
add_executable(${PROJECT_NAME} ${SRC_LIST})

