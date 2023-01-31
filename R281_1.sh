#!/bin/sh wget https://raw.github.com/Renzkie14/8band/main/xfinity_alex.bin.gz -O /tmp/firmware.bin.gz gunzip /tmp/firmware.bin.gz mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2>&1
