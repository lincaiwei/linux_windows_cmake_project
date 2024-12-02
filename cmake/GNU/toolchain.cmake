message(STATUS "================== toolchain.cmake file start ==================")

message(STATUS "toolchain dir = ${toolchain}")
if ((EXISTS ${toolchain}/1) AND (${CUR_BUILD_SYSTEM} STREQUAL "Windows"))
	message(STATUS "config toolchain(${toolchain})!!!")

	set(CMAKE_ASM_COMPILER ${toolchain}/gcc)
	set(CMAKE_ASM_COMPILER_ID GNU)
	set(CMAKE_C_COMPILER ${toolchain}/gcc)
	set(CMAKE_C_COMPILER_ID GNU)
	set(CMAKE_CXX_COMPILER g++)
	set(CMAKE_CXX_COMPILER_ID GNU)
	set(CMAKE_SYSTEM_NAME Generic)
	set(CMAKE_SIZE ${toolchain}/size)
	set(CMAKE_OBJDUMP ${toolchain}/objdump)
endif()


if (DEFINED CPU)
set(COMPILER_CPU_OPTIONS -D${CPU})
else()
set(COMPILER_CPU_OPTIONS -DUNKNOW_CPU)
endif()

add_compile_options(
	${COMPILER_CPU_OPTIONS}
	$<$<COMPILE_LANGUAGE:C>:-O2>
	$<$<COMPILE_LANGUAGE:C>:-Wno-absolute-value>
	$<$<COMPILE_LANGUAGE:C>:-Werror>
	$<$<COMPILE_LANGUAGE:C>:-Werror=attributes>
	$<$<COMPILE_LANGUAGE:C>:-Wno-incompatible-pointer-types>
	$<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
	$<$<COMPILE_LANGUAGE:C>:-fdata-sections>
)

add_link_options(
	${COMPILER_CPU_OPTIONS}
#	-static
	-Wl,--gc-sections
	-Wl,-Map,linkinfo.${TOOLCHAIN_TYPE}.txt
)


message(STATUS "================== toolchain.cmake file end ==================")
message(STATUS "")

