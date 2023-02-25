#!/bin/sh
wget https://github.com/marukoy/project/raw/main/r281_mtd4_4.2.bin -O /tmp/firmware.bin > /dev/null 2>&1
mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1
