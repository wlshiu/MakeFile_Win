#!/bin/bash

set -e

toolchain_path=/C/gcc-arm-none-eabi-4_8-2014q3-win32/bin

export PATH=${toolchain_path}:$PATH

make -f ./Makefile
