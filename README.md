##  🐾 Spoofhound — MAC Address Spoofing & Monitoring Utility
Spoofhound is a lightweight MAC address anonymization and surveillance tool designed for red teamers, network researchers, and privacy advocates.
It provides real-time MAC spoofing, DHCP-based detection logging, and stealthy observation of MAC-level traffic across a selected interface.

## ***🔧 Features:***
***🔒 Interface Spoofing: Randomizes your MAC address (e.g., 9e:e5:7f:87:4c:73) to evade tracking and fingerprinting.***

***📡 Live Monitoring: Uses tcpdump to sniff for BOOTP/DHCP requests from the spoofed MAC.***

***📘 Logging: Writes all appearance events to mac_leak_log.txt with timestamps and packet metadata.***

***🔍 Leak Detection: Alerts when your spoofed MAC is exposed during DHCP handshakes — useful for forensic visibility tests.***

### Installation Guide
```
git clone https://github.com/webdragon63/Spoofhound.git
cd Spoofhound
```
Just run spoofhound.sh -->>`bash spoofhound.sh` tool to spoof your MAC Address and also live monitor it.

***Demo output of live monitoring***
``` bash
🔧 Enter your network interface (e.g., eth0, wlan0) >> wlp1s0
⛔ Disabling interface wlp1s0...
🎭 Spoofing MAC address...
✅ Spoofed MAC: 9e:e5:7f:87:4c:73
📝 Logging DHCP MAC appearances to mac_leak_log.txt
📡 Monitoring interface: wlp1s0
🔍 Watching for spoofed MAC: 9e:e5:7f:87:4c:73

tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on wlp1s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
⚠️ 2025-05-12 20:38:46 - MAC 9e:e5:7f:87:4c:73 detected: 20:38:49.698474 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 9e:e5:7f:87:4c:73 (oui Unknown), length 290
⚠️ 2025-05-12 20:38:46 - MAC 9e:e5:7f:87:4c:73 detected: 20:38:49.808864 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 9e:e5:7f:87:4c:73 (oui Unknown), length 290
⚠️ 2025-05-12 20:38:46 - MAC 9e:e5:7f:87:4c:73 detected: 20:38:49.822489 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 9e:e5:7f:87:4c:73 (oui Unknown), length 296
⚠️ 2025-05-12 20:38:46 - MAC 9e:e5:7f:87:4c:73 detected: 21:08:48.809014 IP 192.168.43.72.bootpc > 192.168.43.1.bootps: BOOTP/DHCP, Request from 9e:e5:7f:87:4c:73 (oui Unknown), length 284
⚠️ 2025-05-12 20:38:46 - MAC 9e:e5:7f:87:4c:73 detected: 21:38:47.809065 IP 192.168.43.72.bootpc > 192.168.43.1.bootps: BOOTP/DHCP, Request from 9e:e5:7f:87:4c:73 (oui Unknown), length 284
```
