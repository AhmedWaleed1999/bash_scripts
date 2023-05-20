```
#!/bin/bash

# CPU usage
echo "CPU Usage:"
top -bn 1 | grep "%Cpu" | cut -d ' ' -f 2- | awk '{print "CPU " NR ": " $0}'
echo

# Memory usage
echo "Memory Usage:"
free -m | awk 'NR==1{print "Total: " $2 " MB"} NR==2{print "Used: " $3 " MB (" $3/$2*100 "%)"} NR==3{print "Free: " $4 " MB (" $4/$2*100 "%)"}'
echo

# Disk space
echo "Disk Space:"
df -h | awk '{print "Filesystem: " $1 "\nMountpoint: " $6 "\nTotal: " $2 "\nUsed: " $3 "\nFree: " $4 "\nPercentage Used: " $5 "\n"}'
echo

# Network statistics
echo "Network Statistics:"
ifconfig | awk '/^[a-z]/ {print "\nInterface: " $1} /RX bytes/ {print "Bytes Received: " $2} /TX bytes/ {print "Bytes Sent: " $6}'
echo

# System uptime
echo "System Uptime:"
uptime | awk '{print "Uptime: " $1}'
echo



```
