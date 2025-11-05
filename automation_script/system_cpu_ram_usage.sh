#!/bin/bash
# =========================================
# Script: system_usage.sh
# Description:
#   Checks CPU and memory usage and
#   lists top 10 consuming processes
# =========================================

# ---- CPU Usage ----
echo ""
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

# ---- Memory Usage ----
echo ""
echo "Memory Usage:"
free -m | awk '/Mem:/ {printf("Used: %d MB / %d MB (%.2f%%)\n", $3, $2, $3/$2 * 100)}'

# ---- Top 10 Processes ----
echo ""
echo "Top 10 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11
