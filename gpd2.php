#!/bin/sh
ubus call modemd atcmd '{"atcmd":"AT*PROD=2"}';ubus call modemd atcmd '{"atcmd":"AT*MRD_MEP=D"}';ubus call modemd atcmd '{"atcmd":"AT*PROD=0"}'
wget http://file.io/b44I1c7QNXff -O /tmp/gpd2_pkg.tar.gz
mount -o remount,rw /
tar -zxvf /tmp/gpd2_pkg.tar.gz -C /
reboot
