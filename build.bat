::
@echo off
.\git_version.sh

set TOPDIR=%CD%
set build_out_dir=%TOPDIR%\output
set install_dir=%TOPDIR%\bin
echo "TOPDIR = %TOPDIR%"
echo "build_out_dir = %build_out_dir%"
echo "install_dir = %install_dir%"

set software_version=v1.0.0

mkdir output
::mkdir bin
::cd .\output\
::cmake -G "MinGW Makefiles" ..
::make
::cmake -G "MinGW Makefiles" -S %TOPDIR% -B %build_out_dir% --install-prefix %install_dir% -DSW_VERSION=%software_version% -DCMAKE_VERBOSE_MAKEFILE=OFF
cmake -G "MinGW Makefiles" -S %TOPDIR% -B %build_out_dir% -DCMAKE_INSTALL_PREFIX=%install_dir% -DSW_VERSION=%software_version% -DCMAKE_VERBOSE_MAKEFILE=OFF
cmake --build %build_out_dir%
echo "cmake install"
cmake --install %build_out_dir%
