#!/bin/bash
# Copyright (c) 2018, Wei-Lun Hsu
# @file    trim_trailing_whitespace.sh
# @author  Wei-Lun Hsu
# @version 0.1

set -e
 
function help()
{
	echo "USAGE: $0 [root path]"
    exit 1
}

if [ $# != 1 ];then
   help
fi

root_path=$1
find ${root_path} -type f -name '*.c' -exec sed -i 's/ *$//' {} \;
find ${root_path} -type f -name '*.h' -exec sed -i 's/ *$//' {} \;
find ${root_path} -type f -iname '*.s' -exec sed -i 's/ *$//' {} \;
find ${root_path} -type f -iname 'Kconfig' -exec sed -i 's/ *$//' {} \;




