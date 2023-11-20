#!/bin/sh
wget http://lucasliam.com/1337/S10G/tozed_/2.11AT.tgz -O /tmp/2.11.tar.gz
echo "Checking hash!" hash=$(md5sum /tmp/2.11.tar.gz | awk '{print $1}')
echo "$hash = 879a99f6e7037eb164c6d97ba7bf5320"
if [ $hash == '879a99f6e7037eb164c6d97ba7bf5320' ] 
then
echo "Same!" tar -zxvf /tmp/2.11.tar.gz -C /tmp/ 
rm -rf /etc_ro/default/default_parameter_user 
mv /tmp/default_parameter_user /etc_ro/default/default_parameter_user
rm -rf /etc_ro/default/default_parameter_sys 
mv /tmp/default_parameter_sys /etc_ro/default/default_parameter_sys 
rm -rf /yaffs/apply_config.conf mv /tmp/apply_config.conf /yaffs/apply_config.conf 
rm -rf /sbin/at_ctl mv /tmp/at_ctl /sbin/at_ctl 
chmod 777 /sbin/at_ctl 
END 
at_cmd at+zreset 
reboot 
else 
echo "Not same!" 
fi
