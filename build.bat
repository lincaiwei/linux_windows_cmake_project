::
@echo off
.\git_version.sh

mkdir output
cd .\output\
cmake -G "MinGW Makefiles" ..
make
