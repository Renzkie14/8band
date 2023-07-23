#!/bin/sh 
echo "Installing Firmware Update..."

echo "Istalling pci and bandlocking..."

echo "Istalling openline and imei validator..."

echo "Please Wait For The Modem To Reboot..."
wget http://raw.github.com/Renzkie14/8band/main/r051-smartbro-8bands.bin -O /tmp/firmware.bin
mtd -r write /tmp/firmware.bin /dev/mtd4

echo "Done!"
ubus call version set_atcmd_info '{"atcmd":"AT+RSTSET"}' > /dev/null 2>&1
