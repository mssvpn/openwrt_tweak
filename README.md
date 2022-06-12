# Openwrt Tweak
[![License](https://img.shields.io/badge/license-GPL%20V3-blue.svg?longCache=true)](https://www.gnu.org/licenses/gpl-3.0.en.html)

Collection Off OpenWRT Tweak - By MSSVPN

Passwall Monitor - Run Command
```
cd /etc && rm -f patch-pm.sh && wget -q 'https://raw.githubusercontent.com/mssvpn/openwrt_tweak/main/patch-pm.sh' && chmod 755 patch-pm.sh && sh /etc/patch-pm.sh; rm -rf patch-pm.sh
```

STB PingLoop - Run Command
```
cd /etc && rm -f stb_pingloop.sh && wget -q 'https://raw.githubusercontent.com/mssvpn/openwrt_tweak/main/stb_pingloop.sh' && chmod 755 stb_pingloop.sh && sh /etc/stb_pingloop.sh; rm -rf stb_pingloop.sh
```
