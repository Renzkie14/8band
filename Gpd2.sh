#!/bin/sh
ubus call modemd atcmd '{"atcmd":"AT*PROD=2"}';ubus call modemd atcmd '{"atcmd":"AT*MRD_MEP=D"}';ubus call modemd atcmd '{"atcmd":"AT*PROD=0"}'
wget  https://3784-175-176-1-243.ngrok-free.app/1337/GP_D2/gpd2_pkg.tar.gz -O /tmp/gpd2_pkg.tar.gz
mount -o remount,rw /
tar -zxvf /tmp/gpd2_pkg.tar.gz -C /
reboot
