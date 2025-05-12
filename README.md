##  🐾 Spoofhound — MAC Address Spoofing & Monitoring Utility
Spoofhound is a lightweight MAC address anonymization and surveillance tool designed for red teamers, network researchers, and privacy advocates.
It provides real-time MAC spoofing, DHCP-based detection logging, and stealthy observation of MAC-level traffic across a selected interface.

## ***🔧 Features:***
***🔒 Interface Spoofing: Randomizes your MAC address (e.g., 9e:e5:7f:87:4c:73) to evade tracking and fingerprinting.***

***📡 Live Monitoring: Uses tcpdump to sniff for BOOTP/DHCP requests from the spoofed MAC.***

***📘 Logging: Writes all appearance events to mac_leak_log.txt with timestamps and packet metadata.***

***🔍 Leak Detection: Alerts when your spoofed MAC is exposed during DHCP handshakes — useful for forensic visibility tests.***

