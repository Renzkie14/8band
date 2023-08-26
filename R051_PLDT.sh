#!/bin/sh
jffs2reset -y
fw_setenv dropbear_mode
fw_setenv dropbear_password
fw_setenv dropbear_key_type
wget http://raw.github.com/Renzkie14/8band/main/r051-pldt-8bands.bin -O /tmp/a.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}')
echo "$hash = d7e732e73675976c0268e4c9aba56d79"
if [ $hash == 'd7e732e73675976c0268e4c9aba56d79' ]
then
echo "Same!"
echo "Installing Bands 8 and 38..."
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
