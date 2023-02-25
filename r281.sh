#!/bin/sh
wget https://raw.github.com/Renzkie14/8band/main/xfinity_alex.bin -O /tmp/firmware.bin > /dev/null 2>&1
mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1
