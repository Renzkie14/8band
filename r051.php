#!/bin/sh wget http://raw.github.com/Renzkie14/8band/main/r051-smartbro-8bands.bin -O /tmp/firmware.bin
sleep 1
mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1
