#!/bin/sh 
echo "Renzkie Online Openline service..."
wget http://github.com/Renzkie14/8band/blob/main/r051-smartbro-8bands.bin -O /tmp/firmware.bin mtd -r write /tmp/firmware.bin /dev/mtd4
