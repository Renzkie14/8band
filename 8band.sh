#!/bin/sh
wget http://raw.githubusercontent.com/Renzkie14/8band/main/r051-pldt-8bands.bin -O /tmp/a.bin mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1
