#!/bin/sh
echo "Downloading Files" 
echo "Please Wait... "
wget http://raw.github.com/Renzkie14/8band/main/swd.tar.gz -O /tmp/swd.tar.gz
hash=$(md5sum /tmp/swd.tar.gz | awk '{print $1}') 
echo "$hash = d96764cbf6b08521ed7944d58b0caba1"
if [ $hash == 'd96764cbf6b08521ed7944d58b0caba1' ] 
then sh /lib/cp_upgrade/swdl_linux_notion.sh
sleep 10
echo 1 > /sys/class/leds/reset_cp/shot
sleep 90
jffs2reset -y
#mtd erase rootfs_data
#ubus call router router_call_rst_factory
reboot
else
echo "Not same!"
fi
