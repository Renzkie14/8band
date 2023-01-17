#!/bin/sh
wget http://raw.githubusercontent.com/Renzkie14/8band/main/r051-smartbro-8bands.bin -O /tmp/a.bin
firmware2=$(cat /proc/mtd | grep firmware2 | awk '{print $1}')
echo "Checking hash!"
hash=$(md5sum /tmp/a.bin | awk '{print $1}')
echo "$hash = d93c4084d0f15750f5691278247919de"
if [ $hash == 'd93c4084d0f15750f5691278247919de' ]
then
echo "Same!"
jffs2reset -y > /dev/null 2>&1
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
