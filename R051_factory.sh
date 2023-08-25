#!/bin/sh 
jffs2reset -y 
fw_setenv dropbear_mode 
fw_setenv dropbear_password 
fw_setenv dropbear_key_type 

wget https://raw.github.com/Renzkie14/8band/main/r051_factory.bin -O /tmp/a.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}') 
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}') 
echo "$hash = 0b9278c99d3ea8c712158f9c44239596" 
if [ $hash == '0b9278c99d3ea8c712158f9c44239596' ] 
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
