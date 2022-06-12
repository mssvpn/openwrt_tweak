#!/bin/bash
# Modded by MSSVPN contact @mssvpn_hq t.me/mssvpn
clear
# Trade Mark
echo '
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| M S S V P N - PASSWALL M O D V.2.2
 -----------------------------------------------------
      OpenWRT Patch MOD by MSSVPN t.me/mssvpn_hq
 -----------------------------------------------------'
echo ''
echo ''
sleep 1
# End Trade Mark
# Running Patch
echo 'Uploading Passwall Monitor. Please wait . . . .'
sleep 2
rm -f /etc/run-pm.sh
sleep 1
cd /etc && wget -q 'https://raw.githubusercontent.com/mssvpn/openwrt_tweak/main/run-pm.sh'
sleep 1
chmod 755 /etc/run-pm.sh
sed -i "/#Passwall Monitor/d" "/etc/crontabs/root"
sed -i "/run-pm.sh/d" "/etc/crontabs/root"
sed -i "/#Passwall Monitor/d" "/etc/crontabs/root"
sed -i "/run-pm.sh/d" "/etc/crontabs/root"
echo '#Passwall Monitor' | tee -a /etc/crontabs/root
echo '* * * * * sh /etc/run-pm.sh' | tee -a /etc/crontabs/root
uci set system.@system[0].cronloglevel="9"
uci commit system
/etc/init.d/cron restart
clear

# Trade Mark
echo '
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| M S S V P N - PASSWALL M O D V.2.2
 -----------------------------------------------------
      OpenWRT Patch MOD by MSSVPN t.me/mssvpn_hq
 -----------------------------------------------------'
echo ''
echo ''
sleep 1
# End Trade Mark
# Running Patch
echo 'Passwall Monitor V2.2 Setup Complete. You can close putty now.'
echo 'Any feedback t.me/mssvpn_hq'
echo ''
echo ''
sleep 2