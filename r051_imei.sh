#!/bin/sh
ubus call version set_atcmd_info '{"atcmd":"AT+FLASHBP=0"}'
sleep 1
ubus call version set_atcmd_info '{"atcmd":"AT*MRD_IMEI=D"}'
sleep 1
ubus call version set_atcmd_info '{"atcmd":"AT*MRD_IMEI=W,0101,01NOV2012,354386088775460"}'
sleep 2
echo "please wait for the modem to reboot..."
echo "rebooting..."
reboot
exit