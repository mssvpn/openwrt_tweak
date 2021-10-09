#!/bin/bash
# Modded by MSSVPN contact @mssvpn_hq t.me/mssvpn
clear
#
echo '
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| M S S V P N - STB M O D V.1.1
 -----------------------------------------------------
          STB OpenWRT Patch MOD by MSSVPN
 -----------------------------------------------------'
echo ''
echo ''
sleep 1
#
#
echo 'Create STB pingloop config. Please wait . . . .'
sleep 2
rm -f /etc/pingloop.sh
sleep 1
#
cat <<'EOF' >>/etc/pingloop.sh
#!/bin/bash
# Modded by MSSVPN contact @mssvpn_hq t.me/mssvpn
# --- Pingloop start ---
echo "Checking Ping Loop Already Run?"
sleep 1
if [ "$(pgrep -f /etc/pingloop.sh | wc -l)" -gt 2 ]; then
        echo "Pingloop Already Running!"
        exit 1
else
        echo "NO Duplicate Pingloop Process.."
        echo "Start Pingloop."
        echo ""
fi
echo "Check network outbound using PING.."
                if /bin/ping -c 59 8.8.8.8 > /dev/null 2>&1; then
                        echo "Ping to Google DNS Working Fine..."
                        echo ""
                        exit 0
                else
                        echo "Failed to ping google DNS. Restart network."
                        /etc/init.d/network restart
                        echo "Pause Pingloop process for 120 second."
                        sleep 120
                        exit 0
                fi
sleep 1
echo "End Pingloop."
# --- Pingloop END ---
EOF
sleep 1
chmod 755 /etc/pingloop.sh
#
sed -i "/#STB Pingloop/d" "/etc/crontabs/root"
sed -i "/etc/pingloop.sh" "/etc/crontabs/root"
sed -i "/#STB Pingloop/d" "/etc/crontabs/root"
sed -i "/etc/pingloop.sh" "/etc/crontabs/root"
echo '#STB Pingloop by MSSVPN' | tee -a /etc/crontabs/root
echo '* * * * * sh /etc/pingloop.sh' | tee -a /etc/crontabs/root
sleep 1
uci set system.@system[0].cronloglevel="9"
uci commit system
/etc/init.d/cron restart
sleep 1
clear
#
echo '
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| M S S V P N - STB M O D V.1.1
 -----------------------------------------------------
          STB OpenWRT Patch MOD by MSSVPN
 -----------------------------------------------------'
echo ''
echo ''
sleep 2
#
#
echo 'STB OpenWRT PingLoop complete. You can close putty now.'
echo 'Any feedback t.me/mssvpn_hq'
echo ''
echo ''
sleep 2
exit
