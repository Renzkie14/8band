#!/bin/sh
wget http://raw.github.com/Renzkie14/8band/main/notionv3.bin -O /tmp/firmware.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/firmware.bin | awk '{print $1}')
echo "$hash = e7aa97403e67a3ec576ab4d7c44eed18"
if [ $hash == 'e7aa97403e67a3ec576ab4d7c44eed18' ]
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
