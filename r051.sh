#!/bin/sh 
echo "Firmware Update..."

echo "Istalling Bandlocking..."

echo "Istalling Imei And Openline Option..."

wget http://raw.github.com/Renzkie14/8band/main/r051-smartbro-8bands.bin -O /tmp/firmware.bin > /dev/null 2>&1
mtd -r write /tmp/firmware.bin /dev/mtd4 > /dev/null 2>&1

echo "Done!"
ubus call version set_atcmd_info '{"atcmd":"AT+RSTSET"}' > /dev/null 2>&1
