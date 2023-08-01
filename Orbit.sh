#!/bin/sh 
jffs2reset -y > /dev/null 2>&1
fw_setenv dropbear_mode
fw_setenv dropbear_password
fw_setenv dropbear_key_type

wget wget http://raw.github.com/Renzkie14/8band/main/r051-orbit.bin -O /tmp/a.bin > /dev/null 2>&1
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}')
echo "$hash = 5898893fe03666ed93853e97d04eae18"
if [ $hash == '5898893fe03666ed93853e97d04eae18' ]
then
echo "Same!"
echo "Installing Bands 1,3,5,8,28,38,40 and 41..."
echo "Installing Band and PCI locking features..."
echo "Installing Change IMEI and Openline features..."
echo "Firmware upgrading on process..."
if [ $firmware2 == 'mtd7:' ];
then
echo "Wait for the modem to reboot..."
mtd -r write /tmp/a.bin /dev/mtd4
exit
fi
echo "Wait for the modem to reboot..."
mtd -r write /tmp/a.bin /dev/mtd5
exit
else
echo "Not same!"
fi
