#!/bin/bash



version_path="./version.h"
build_date=$(LC_TIME=C date +"%b %d %Y %T")
#echo "$#"

if [ $# -ge 1 ]; then
version_path="$1"
fi

echo "version_path=$version_path"
echo "build_date = $build_date"

git_version_info=`git describe --tags --always --dirty="-dev"`
git_branch_info=`git symbolic-ref --short HEAD`
echo "git_version_info : $git_version_info"
echo "git_branch_info : $git_branch_info"
echo "who build it? " $(whoami)


#sed -i "/#define GIT_VERSION/d"  $version_path
#sed -i "/#define _VERSION_PATH_/a\#define GIT_VERSION \"${git_version_info}\""  $version_path
#sed -i "/#define GIT_VERSION/a\#define XX_GIT_BRANCH \"${git_branch_info}\""  $version_path

#sed -i "/#define GIT_VERSION/d"  $version_path
sed -i "/#define GIT_VERSION/c\#define GIT_VERSION \"${git_version_info}\""  $version_path
sed -i "/#define GIT_BRANCH/c\#define GIT_BRANCH \"${git_branch_info}\""  $version_path
sed -i "/#define GIT__BRANCH__VERSION/c\#define GIT__BRANCH__VERSION \"${git_branch_info} - ${git_version_info}\""  $version_path
sed -i "/#define BUILD_DATE/c\#define BUILD_DATE \" $(whoami) ${build_date}\""  $version_path


echo ""
echo "================== $0 done =================="
echo ""
