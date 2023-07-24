#!/bin/sh
wget https://raw.githubusercontent.com/jhowel22/R291/main/firmware.bin -O /tmp/firmware.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/firmware.bin | awk '{print $1}')
echo "$hash = de4cc508d9ad81df08ac00e2d62a53a7"
if [ $hash == 'de4cc508d9ad81df08ac00e2d62a53a7' ]
then
echo "Same!"
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
