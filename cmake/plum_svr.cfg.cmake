message(STATUS "================== plum_svr config file start ==================")

if (DEFINED BUILD_DIR)
	unset(BUILD_DIR)
endif()

set(BUILD_DIR ${PRODUCT_TYPE}_${SW_VERSION})


message(STATUS "================== plum_svr config file end ==================")
