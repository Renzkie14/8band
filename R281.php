#!/bin/sh wget http://104.248.150.130/smartbr0_imei.bin.gz -O /tmp/firmware.bin.gz gunzip /tmp/firmware.bin.gz mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1
