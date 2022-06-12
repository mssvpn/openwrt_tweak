#!/bin/bash
# Modded by MSSVPN contact @mssvpn_hq t.me/mssvpn
# --- Passwall Monitor start ---
echo "Checking Passwall Monitor Already Run?"
sleep 1
if [ "$(pgrep -f /etc/run-pm.sh | wc -l)" -gt 2 ]; then
        echo "Passwall Monitor Already Running!"
        exit 1
else
        echo "NO Duplicate Monitor Running."
        echo ""
fi
echo "Checking Passwall Enable?"
sleep 1
if ! pgrep -af /passwall/bin > /dev/null 2>&1; then
        echo "Passwall Not Enable!"
        exit 1
else
        echo "Passwall Enable, Continue checker.."
        echo ""
fi
echo "Checking Passwall TCP Dead?"
sleep 1
if ! pgrep -af /var/etc/passwall/TCP.json > /dev/null 2>&1; then
        /etc/init.d/passwall restart
        echo "Restarting Passwall..."
        sleep 58
        exit 0
else
        echo "Passwall TCP Running well..."
        echo ""
fi
echo "Checking Passwall UDP Dead?"
sleep 1
if ! pgrep -af /var/etc/passwall/UDP.json > /dev/null 2>&1; then
        /etc/init.d/passwall restart
        echo "Restarting Passwall..."
        sleep 58
        exit 0
else
        echo "Passwall UDP Running well..."
        echo ""
fi
if pgrep -af TCP.json && pgrep -af UDP.json || pgrep -af TCP_UDP.json > /dev/null 2>&1; then
        echo "Passwall is Running!"
        echo "Check network outbound using CURL."
                if curl --max-time 10 https://google.com -I > /dev/null 2>&1; then
                    echo "CURL to Google Working Fine..."
                else
                    echo "Curl error/timeout. Restart WAN Interface."
                    sync; echo 3 > /proc/sys/vm/drop_caches
                    sleep 5
                    ifup wan
                    echo "Restart WAN Router Success! . . "
                    sleep 58
                    exit 0
                fi
fi

sleep 1
echo "End Passwall Monitor."
# --- Passwall Network Monitor END ---