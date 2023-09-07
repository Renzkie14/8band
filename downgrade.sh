#!/bin/sh
mount -o remount,rw /
http://raw.github.com/Renzkie14/8band/main/libtarget.so -O /tmp/libtarget.so
hash=$(md5sum /tmp/libtarget.so | awk '{print $1}')
if [ $hash == 'e9e36ba42bc24b793e0808464454a1e5' ]
then
rm -rf /lib/libtarget.so
cp /tmp/libtarget.so /lib/libtarget.so
chmod 777 /lib/libtarget.so
nvram_set 0 http_passwd d4c5f6b22dd95dda416a53e5e77e932eb88fa422
nvram commit 0
echo e9e36ba42bc24b793e0808464454a1e5 > /usr/www/hash.css
echo $(md5sum /lib/libtarget.so | awk '{print $1}') >> /usr/www/hash.css
fi
