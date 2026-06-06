#!/bin/bash
echo "==============================="
echo "   SYSTEM HEALTH MONITOR"
echo "   $(date)"
echo "================================"

echo ""
echo "🖥️  CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "   Used: " $2 "%"}'

echo ""
echo "💾  Memory Usage:"
free -h | awk '/^Mem:/ {print "   Total: "$2 "  Used: "$3 "  Free: "$4}'

echo ""
echo "💿  Disk Usage:"
df -h / | awk 'NR==2 {print "   Total: "$2 "  Used: "$3 "  Free: "$4 "  Usage: "$5}'

echo ""
echo "🌐  Network Interfaces:"
ip -brief addr | awk '{print "   "$1 " -> " $3}'

echo ""
echo "⚙️  Top 5 Memory-Hungry Processes:"
ps aux --sort=-%mem | awk 'NR<=6 {printf "   %-20s %s%%\n", $11, $4}'

echo "==============================="
