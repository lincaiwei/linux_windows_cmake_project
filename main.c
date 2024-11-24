#include <stdio.h>
#include "arch.h"

int main(int argc,char **argv)
{
    printf("%s %s\n %s\n %s\n",BUILD_DATE,SW_DRV_DESCRIPTION,
		GIT__BRANCH__VERSION, SW_DRV_COPYRIGHT);
    printf("%s %d\n", __FUNCTION__, __LINE__);
    
    return 0;
}

