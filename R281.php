#!/bin/sh wget http://github.com/Renzkie14/8band/raw/main/xfinity_alex.bin -O /tmp/firmware.bin mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1
