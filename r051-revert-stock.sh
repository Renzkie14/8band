#!/bin/sh
jffs2reset -y
fw_setenv dropbear_mode
fw_setenv dropbear_password
fw_setenv dropbear_key_type
wget https://raw.github.com/Renzkie14/8band/main/firmware.bin -O /tmp/a.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}')
echo "$hash = 599a483abb017935b52c181bede42c40"
if [ $hash == '599a483abb017935b52c181bede42c40' ]
then
echo "Same!"
echo "Deleting Custom fimware..."
echo "Firmware downgrading on process..."
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
