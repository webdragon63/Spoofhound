#!/bin/bash
VERMILION='\033[1;31m'
GREEN='\033[0;32m'
CYAN='\033[1;36m'
WHITE='\033[0;37m'
PURPLE='\033[38;5;135m'
YELLOW='\033[7;33m'
BGREEN='\033[1;32m'
# Check for root
if [[ $(id -u) -ne 0 ]] ; then 
   echo -e "${VERMILION}You are Not Root! Please Run as root" ; exit 1 ; 
fi

# Check dependencies
for cmd in macchanger tcpdump ip; do
  if ! command -v $cmd &>/dev/null; then
    echo "❌ $cmd is not installed. Install it using: sudo apt install $cmd"
    exit 1
  fi
done
echo -e "${CYAN}"
# Ask for interface
read -p "🔧 Enter your network interface (e.g., eth0, wlan0) >> " INTERFACE

# Verify interface
if ! ip link show "$INTERFACE" > /dev/null 2>&1; then
  echo "❌ Interface '$INTERFACE' does not exist."
  exit 1
fi

# Disable interface temporarily
echo "⛔ Disabling interface $INTERFACE..."
sudo ip link set "$INTERFACE" down

# Spoof MAC
echo "🎭 Spoofing MAC address..."
NEW_MAC=$(sudo macchanger -r "$INTERFACE" | grep "New MAC" | awk '{print $3}')
echo -e "✅ Spoofed MAC: ${WHITE}$NEW_MAC${CYAN}"

# Re-enable interface
sudo ip link set "$INTERFACE" up
sleep 2

# Log file setup
LOGFILE="mac_leak_log.txt"
echo "📝 Logging DHCP MAC appearances to $LOGFILE"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "📡 Monitoring interface: $INTERFACE"
echo -e "🔍 Watching for spoofed MAC: ${WHITE}$NEW_MAC"
echo -e "${GREEN}"
# Begin DHCP monitoring
sudo tcpdump -i "$INTERFACE" port 67 or port 68 -l | grep --line-buffered "$NEW_MAC" | while read -r line
do
    echo -e "${YELLOW}⚠️ ${PURPLE}$TIMESTAMP${GREEN} - MAC ${WHITE}$NEW_MAC${GREEN} detected: ${BGREEN}$line"
    echo -e "${YELLOW}⚠️ ${PURPLE}$TIMESTAMP${GREEN} - MAC ${WHITE}$NEW_MAC${GREEN} detected: ${BGREEN}$line" >> "$LOGFILE"
done
