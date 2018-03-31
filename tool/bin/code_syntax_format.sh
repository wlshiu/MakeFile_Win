#!/bin/bash

set -e

cur_dir=`pwd`

sdk_root=.
while [ ! $(find ${sdk_root} -maxdepth 1 -type d -name 'sdk') ]; do
    sdk_root="$sdk_root/.."
done

cd $sdk_root
sdk_root=`pwd`

file_list=__tmp.lst

dir_list=(
# "./bsp"
# "./platform"
# "./project"
# "./sdk/driver/aes"
# "./sdk/driver/audio"
# "./sdk/driver/audio_alg"
# "./sdk/driver/cis"
# "./sdk/driver/dsp"
# "./sdk/driver/efuse"
# "./sdk/driver/gpio"
# "./sdk/driver/i2c"
# "./sdk/driver/idma"
# "./sdk/driver/iso_rtc"
# "./sdk/driver/jpg_csc"
# "./sdk/driver/mcu8080"
# "./sdk/driver/pmu"
# "./sdk/driver/ppu"
# "./sdk/driver/sar_adc"
"./sdk/driver/spi_ssp"
# "./sdk/driver/usb"
# "./sdk/include"
)


for path in "${dir_list[@]}"; do
    patt=`echo ${path} | sed 's:\/:\\\/:g'`

    find ${path} -type f -name '*.c' -exec astyle_format.sh {} \;
    find ${path} -type f -name '*.h' -exec astyle_format.sh {} \;
done

