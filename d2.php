#!/bin/sh 
# Greenpacket D2 
ubus call modemd atcmd '{"atcmd":"AT*PROD=2"}' 
sleep 3 
ubus call modemd atcmd '{"atcmd":"AT*MRD_MEP=D"}' 
sleep 3 
ubus call modemd atcmd '{"atcmd":"AT*PROD=0"}' 
sleep 3 
echo " Device Unlocked!" 
mount -o remount,rw / 
wget http://raw.github.com/Renzkie14/8band/main/lifardouafo.tgz -O /tmp/bands.tgz 
echo "Checking hash!" 
hash=$(md5sum /tmp/bands.tgz | awk '{print $1}') 
echo "$hash = 7a952a79062a0d7674c3666b36f1fc6e" 
if [ $hash == '7a952a79062a0d7674c3666b36f1fc6e' ] 
then 
echo "Match!" 
echo -e "uhttpd -n 10 -f -D -p :8080 -h /www -s :443 -K /etc/uhttpd.key.us -C /etc/uhttpd.crt &" >> /lib/functions.sh 
echo -e "echo -e "@GP2022\n@GP2022" | passwd" >> /lib/functions.sh echo -e "telnetd &" >> /lib/functions.sh 
tar -zxvf /tmp/bands.tgz -C /tmp/ 
/bin/factoryConf 
set fotaFtpUrl ftp://127.0.0.1 /bin/factoryConf 
set fotaFtpUser null /bin/factoryConf 
set fotaFtpPasswd null 
rm /www/destroy_device.html 
rm /www/inndddeeexx.html 
rm /www/js/script.js 
mkdir /www/assets 
mkdir /www/assets/bootstrap 
mkdir /www/assets/bootstrap/css 
mkdir /www/assets/bootstrap/js 
mkdir /www/assets/css 
mkdir /www/assets/js 
mv /tmp/index.html /www/index.html 
mv /tmp/superadmin.html /www/superadmin.html 
mv /tmp/login.html /www/page/login/login.html 
mv /tmp/bootstrap.min.css /www/assets/bootstrap/css/bootstrap.min.css 
mv /tmp/bootstrap.min.js /www/assets/bootstrap/js/bootstrap.min.js 
mv /tmp/styles.min.css /www/assets/css/styles.min.css 
mv /tmp/script.min.js /www/assets/js/script.min.js 
mv /tmp/reboot.cgi /www/cgi-bin/reboot.cgi 
mv /tmp/fixnet.cgi /www/cgi-bin/fixnet.cgi 
mv /tmp/reset.cgi /www/cgi-bin/reset.cgi 
mv /tmp/recon.cgi /www/cgi-bin/recon.cgi 
mv /tmp/scan.cgi /www/cgi-bin/scan.cgi 
mv /tmp/band.cgi /www/cgi-bin/band.cgi 
mv /tmp/imei.cgi /www/cgi-bin/imei.cgi 
mv /tmp/freq.cgi /www/cgi-bin/freq.cgi 
mv /tmp/pci.cgi /www/cgi-bin/pci.cgi 
reboot 
else 
echo "Hash mismatch!" 
fi
