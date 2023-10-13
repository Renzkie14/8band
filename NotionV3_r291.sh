#!/bin/sh
wget http://raw.github.com/Renzkie14/8band/main/notionv3r291.bin -O /tmp/firmware.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/firmware.bin | awk '{print $1}')
echo "$hash = caa5c1d2c5287bdfc85d61e9b2753a1d"
if [ $hash == 'caa5c1d2c5287bdfc85d61e9b2753a1d' ]
then
echo "Same!"
echo "Installing Bands 1,3,5,8,28,38,40 and 41..." 
echo "Installing Band and PCI locking features..." 
echo "Installing Change IMEI and Openline features..." 
echo "Firmware upgrading on process..." 
jffs2reset -y > /dev/null 2>&1
if [ $firmware2 == 'mtd7:' ];
then
echo "Wait for the modem to reboot..."
mtd -r write /tmp/firmware.bin /dev/mtd4
exit
fi
echo "Wait for the modem to reboot..."
mtd -r write /tmp/firmware.bin /dev/mtd5
exit
else
echo "Not same!"
fi
