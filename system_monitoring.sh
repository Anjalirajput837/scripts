#!/bin/bash


OUTPUT_FILE="system_monitor.log"


CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEMORY=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
DISK=$(df -h / | awk 'NR==2 {print $5}')
UPTIME=$(uptime -p)
TOP_PROCESSES=$(ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6)


{
    echo "System Monitoring Report - $(date)"
    echo "---------------------------------"
    echo "CPU Usage: $CPU%"
    echo "Memory Usage: $MEMORY%"
    echo "Disk Usage: $DISK"
    echo "Uptime: $UPTIME"
    echo ""
    echo "Top 5 Processes by CPU Usage:"
    echo "$TOP_PROCESSES"
    echo "---------------------------------"
    echo ""
} >> $OUTPUT_FILE

echo "System Monitoring Report - $(date)"
echo "---------------------------------"
echo "CPU Usage: $CPU%"
echo "Memory Usage: $MEMORY%"
echo "Disk Usage: $DISK"
echo "Uptime: $UPTIME"
echo ""
echo "Top 5 Processes by CPU Usage:"
echo "$TOP_PROCESSES"
echo "---------------------------------"gi