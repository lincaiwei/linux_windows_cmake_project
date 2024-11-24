:: update version information

@echo off


set CURRENT_PATH=%CD%
echo Current Path: %CURRENT_PATH%

set version_path=".\version.h"
set build_date="%date%  %time%"
echo current time is %date%  %time%

@echo "version_path=%version_path%"
@echo "build_date = %build_date%"



set git_version_info='git describe --tags --always --dirty="-dev"'
set git_branch_info=`git symbolic-ref --short HEAD`
@echo "git_version_info : %git_version_info%"
@echo "git_branch_info : %git_branch_info%"


::sed -i "/#define GIT_VERSION/d"  %version_path%
::sed -i "/#define _VERSION_PATH_/a\#define GIT_VERSION \"${git_version_info}\""  %version_path%
::sed -i "/#define GIT_VERSION/a\#define XX_GIT_BRANCH \"${git_branch_info}\""  %version_path%

::sed -i "/#define GIT_VERSION/d"  %version_path%
::.\tools\gnuwin32\sed.exe -i "/#define GIT_VERSION/c\#define GIT_VERSION \%git_version_info%\""  %version_path%
::.\tools\gnuwin32\sed.exe -i "/#define GIT_BRANCH/c\#define GIT_BRANCH \"%git_branch_info%\""  %version_path%
::.\tools\gnuwin32\sed.exe -i "/#define GIT__BRANCH__VERSION/c\#define GIT__BRANCH__VERSION \"%git_branch_info% - %git_version_info%\""  %version_path%
::.\tools\gnuwin32\sed.exe -i "/#define BUILD_DATE/c\#define BUILD_DATE \" %USERNAME% %build_date%\"" %version_path%


::@echo ""
::@echo "================== $0 done =================="
::@echo ""

.\git_version.sh
exit
