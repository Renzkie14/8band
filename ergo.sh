#!/bin/sh 
jffs2reset -y 
fw_setenv dropbear_mode 
fw_setenv dropbear_password 
fw_setenv dropbear_key_type 

wget http://raw.github.com/Renzkie14/8band/main/r051-ErgO2022-andres.bin -O /tmp/a.bin > /dev/null 2>&1
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}') 
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}') 
echo "$hash = 36d31c803fa6d24fa2b29c552b0e82e4" 
if [ $hash == '36d31c803fa6d24fa2b29c552b0e82e4' ] 
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
