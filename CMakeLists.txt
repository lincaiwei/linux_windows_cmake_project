# CMake 最低版本号要求
cmake_minimum_required (VERSION 3.2)

# message( [STATUS|WARNING|AUTHOR_WARNING|FATAL_ERROR|SEND_ERROR] "message to display" ...)
message(STATUS "cmake start!")
message(STATUS "CMAKE version = ${CMAKE_VERSION}")
message(STATUS "SW_VERSION = ${SW_VERSION}")
message(STATUS "CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")

set(cmake_config_dir ${CMAKE_SOURCE_DIR}/cmake)
message(STATUS "cmake_config_dir = ${cmake_config_dir}")

set(toolchain ${CMAKE_SOURCE_DIR}/tools/mingw64/bin)
message(STATUS "toolchain = ${toolchain}")

if (NOT DEFINED PRODUCT_TYPE)
	set(PRODUCT_TYPE plum_svr)
endif()

if (NOT DEFINED PLATFORM)
	set(PLATFORM ${CMAKE_HOST_SYSTEM_NAME})
endif()

set(default_cfg_file ${cmake_config_dir}/defconfig.cmake)
message(STATUS "default_cfg_file = ${default_cfg_file}")

set(cfg_file ${cmake_config_dir}/${PRODUCT_TYPE}.cfg.cmake)
if (EXISTS ${cfg_file})
	message(STATUS "load PRODUCT_TYPE(${PRODUCT_TYPE}) config file(${cfg_file})!!!")
	include(${cfg_file})
endif()

if (EXISTS ${default_cfg_file})
	message(STATUS "load default config file(${default_cfg_file})!!!")
	include(${default_cfg_file})
endif()

if (NOT DEFINED TOOLCHAIN_TYPE)
	set(TOOLCHAIN_TYPE GNU)
endif()

# 项目名称, 参数值是 main, 该命令表示项目的名称是 main
project(${PRODUCT_TYPE}_main)

set(toolchain_file ${cmake_config_dir}/${TOOLCHAIN_TYPE}/toolchain.cmake)
if (EXISTS ${toolchain_file})
	include(${toolchain_file})
else()
	message(STATUS "[TOOLCHAIN]${toolchain_file} is not exists!!!")
endif()

set(build_setting ${cmake_config_dir}/compiler_build_cfg.cmake)
if (EXISTS ${build_setting})
	include(${build_setting})
else()
	message(STATUS "[BUILD_SET]${build_setting} is not exists!!!")
endif()


### output cmake config information
set(output_cfg_file ${cmake_config_dir}/output_cfg.cmake)
if (EXISTS ${output_cfg_file})
	message(STATUS "output cmake config information(${output_cfg_file})!!!")
	include(${output_cfg_file})
endif()

#把当前目录(./)下所有源代码文件和头文件加入变量SRC_LIST
aux_source_directory(. SRC_LIST)

# 显示指定使用的C编译器 
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

# 指定生成目标
add_executable(${PROJECT_NAME} ${SRC_LIST})

