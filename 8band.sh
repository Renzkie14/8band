#!/bin/sh
wget https://github.com/Renzkie14/8band/blob/main/r051-%40ErgO2022-andres.bin -O /tmp/firmware.bin > /dev/null 2>&1
mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1
