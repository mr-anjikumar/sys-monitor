#!/bin/bash
echo "==============================="
echo "   SYSTEM HEALTH MONITOR"
echo "   $(date)"
echo "==============================="

# 👇 This new section shows where the script is running
echo ""
echo "📦  Running Inside: Docker Container"
echo "   Container Hostname : $(hostname)"
echo "   Container ID       : $(cat /proc/self/cgroup | grep memory | cut -d'/' -f3 | head -1)"
echo "   Image Used         : system-monitor:v1"
echo "   Monitored By       : anjikumarreddy"

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

echo ""
echo "==============================="
echo "   ✅ Source  : Docker Container"
echo "   ✅ Project : Day 1 - DevOps Journey"
echo "   ✅ GitHub  : github.com/mr-anjikumar"
echo "==============================="