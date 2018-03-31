#!/bin/bash

set -e

cur_dir=`pwd`

sdk_root=.
while [ ! $(find ${sdk_root} -maxdepth 1 -type d -name 'sdk') ]; do
    sdk_root="$sdk_root/.."
done

cd $sdk_root
sdk_root=`pwd`

find . \
    -type d -path '.git*' -prune -o \
    -type d -path '*/build' -prune -o \
    -type d -path '*/sdk/driver/rom_code' -prune -o \
    -type d -path 'tool*' -prune -o \
    -type d -path 'doc*' -prune -o \
    -type f -name '*.c' -o -name '*.h' -o -iname '*.s' > cscope.files

# find ./platform             \
    # ./bsp                   \
    # ./project               \
    # ./sdk/driver/aes        \
    # ./sdk/driver/audio      \
    # ./sdk/driver/audio_alg  \
    # ./sdk/driver/cis        \
    # ./sdk/driver/dsp        \
    # ./sdk/driver/efuse      \
    # ./sdk/driver/gpio       \
    # ./sdk/driver/i2c        \
    # ./sdk/driver/idma       \
    # ./sdk/driver/iso_rtc    \
    # ./sdk/driver/jpg_csc    \
    # ./sdk/driver/mcu8080    \
    # ./sdk/driver/pmu        \
    # ./sdk/driver/ppu        \
    # ./sdk/driver/sar_adc         \
    # ./sdk/driver/spifc           \
    # ./sdk/driver/spi_ssp         \
    # ./sdk/driver/timer_pwm       \
    # ./sdk/driver/uart            \
    # ./sdk/driver/usb             \
    # ./sdk/driver/util \
    # ./sdk/driver/wdt  \
    # ./sdk/include     \
    # -type f -name '*.c' -o -name '*.h' -o -iname '*.s' > cscope.files

cd ${cur_dir}
