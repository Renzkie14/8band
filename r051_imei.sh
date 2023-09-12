#!/bin/sh
ubus call version set_atcmd_info '{"atcmd":"AT+FLASHBP=0"}'
sleep 3
ubus call version set_atcmd_info '{"atcmd":"AT*MRD_IMEI=D"}'
sleep 3
ubus call version set_atcmd_info '{"atcmd":"AT*MRD_IMEI=W,0101,01NOV2012,354386955468926"}'
sleep 3
echo "please wait for the modem to reboot..."
reboot
exit
