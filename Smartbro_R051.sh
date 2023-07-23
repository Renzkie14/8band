#!/bin/sh 
echo "Installing Firmware Update..."

echo "Istalling PCI And Bandlocking..."

echo "Istalling Imei And Openline Option..."

wget http://raw.github.com/Renzkie14/8band/main/r051-smartbro-8bands.bin -O /tmp/firmware.bin

echo "Wait For The Modem To Reboot..."

mtd write /tmp/firmware.bin /dev/mtd4

echo "Done!"
reboot
