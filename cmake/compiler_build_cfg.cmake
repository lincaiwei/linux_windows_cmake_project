message(STATUS "================== compiler build config(build setting) start ==================")

## disable link time optimization(Interprocedural optimization)
if (${CMAKE_VERSION} VERSION_LESS 3.22)
	message(STATUS "${CMAKE_VERSION} VERSION_LESS 3.22")
else()
	set_target_properties(CMAKE_INTERPROCEDURAL_OPTIMIZATION FALSE)
endif()

# set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_OUTPUT_EXTENSION_REPLACE ON)
set(CMAKE_ASM_OUTPUT_EXTENSION_REPLACE ON)
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)


enable_language(C ASM)
set(CMAKE_ASM_SOURCE_FILE_EXTENSIONS S)


###宏定义
macro (SET_ARG_TO_C val)
	string(TOUPPER ${val} val_upper)
	string(CONCAT C_MACRO "CFG_" ${val_upper})
	list(APPEND CCFLAGS -D${C_MACRO})
endmacro()

SET_ARG_TO_C(${PLATFORM})

###宏定义
macro (CONCAT_UPPER_MACRO prefix val)
	string(TOUPPER ${val} val_upper)
	list(APPEND CCFLAGS -D${prefix}${val_upper})
endmacro()

CONCAT_UPPER_MACRO("CFG_SW_VERSION_"  ${SW_VERSION})

list(APPEND CCFLAGS -DPRODUCT_TYPE=${PRODUCT_TYPE})

if (DEFINED CPU)
	if (${CPU} STREQUAL "cortex-A53")
		add_compile_options($<$<COMPILE_LANGUAGE:C>:-Xfpus>)
	##else()
	endif()
endif()

if (DEFINED HEAP_SIZE)
	if (${HEAP_SIZE})
		add_link_options(-Hheap=${HEAP_SIZE})
	endif()
endif()

