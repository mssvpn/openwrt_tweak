#!/bin/sh
#script by Abi Darwish https://t.me/Abi_Darwish Modded for OpenWRT by MSSVPN
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36";
HUNT_IP=$(curl -s --user-agent "${UA_Browser}" -sL "https://api-ipv4.ip.sb/ip" --max-time 5 2>&1)
ISP=$(curl --max-time 5 -s --user-agent "${UA_Browser}" "https://api.ip.sb/geoip/${HUNT_IP}" | cut -f1 -d"," | cut -f4 -d '"')
set -e
set -o pipefail
i=1
function header() {
echo '
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| M S S V P N - HUNT IP Maxis V.1.2
 -----------------------------------------------------
   Source AutoScript by Abi Darwish t.me/Abi_Darwish
    Modded OpenWRT HuntIP by MSSVPN t.me/mssvpn_hq
 -----------------------------------------------------'
echo ''
}
clear
printf "\n \e[1m%-10s\e[0m" "Initializing..."
sleep 3
clear
header
printf " \e[1m%-5s\e[0m\n" "Your ISP:${ISP}"
printf " \e[1m%-5s\e[0m\n" "Processing to hunt IP Range:113.211.x.x"
printf " \e[1m%-5s\e[0m\n" "(press Ctrl+C to cancel)..."
echo
printf " \e[1m%-5s \e[1m%-16s %10s\e[0m\n" "No." "IP Address" "Status"
#echo
while true; do
publicIP=$(curl -s --user-agent "${UA_Browser}" -sL "https://api-ipv4.ip.sb/ip" --max-time 5 2>&1)
if [[ ${HUNT_IP} == 113.211* ]]; then
    printf " \e[1m%-5s \e[1m%-16s \e[1;32m%10s\e[0m\n" "$i)" "${publicIP}" "Success (IP range was found)"
    echo "You can turn on VPN now."
    exit 0
fi
sleep 0.5
printf " \e[1m%-5s \e[1m%-16s \e[1;31m%10s\e[0m\n" "$i)" "${publicIP}" "Failed (IP not in range)"
sleep 0.5
curl -s -o /dev/null --max-time 5 http://192.168.8.1:8989/cgi-bin/changeip.cgi
if [[ $? != 0 ]]; then
     echo
     printf " \e[1m%-5s\e[31m\n" "Error: your modem doesn't have AIO installed"
     exit 1
fi
sleep 15
i=$(( $i + 1 ))
done