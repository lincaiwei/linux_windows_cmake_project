
message(STATUS "================== default config file start ==================")
message(STATUS "include defconfig.cmake")

## Set product name
if (NOT DEFINED PRODUCT)
# set product default name
set(PRODUCT Main)
endif()

if (NOT DEFINED ARCH)
# set arch
set(ARCH ${CMAKE_HOST_SYSTEM_PROCESSOR})
endif()

if (NOT DEFINED CPU)
# set CPU
set(CPU ${CMAKE_HOST_SYSTEM_PROCESSOR})
endif()

if (NOT DEFINED CUR_BUILD_SYSTEM)
# 
set(CUR_BUILD_SYSTEM ${CMAKE_HOST_SYSTEM_NAME})
endif()

if (NOT DEFINED SW_VERSION)
# set SW_VERSION
set(SW_VERSION V1.0.00)
endif()

if (NOT DEFINED BUILD_DIR)
set(BUILD_DIR ${PRODUCT}_${SW_VERSION})
endif()

if (NOT DEFINED O)
# Optimization level to user during compilation
# gcc: 0, 1, 2, 3, s
set(O 2)
endif()

if (NOT DEFINED SAVETMP)
# whether compiler should keep temporaty files
# valid value: ['0', '1']
set(SAVETMP 0)
endif()

if (NOT DEFINED V)
# Verbosity Level (0: show complete command, 1: show short command)
# valid value: ['0', '1']
set(V 0)
endif()

if (NOT DEFINED TOOLCHAIN)
# build toolchain
# valid value: GNU, ARMCC
set(TOOLCHAIN GNU)
endif()



message(STATUS "================== default config file end ==================")
