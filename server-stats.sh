#!/bin/bash


echo "CPU usage"
top -bn1 |top -bn1 | grep "Cpu(s)" | awk '{print "CPU usage; "100- $8 "%"}'
echo ""
echo "Memory Usage"
free -h | awk '/Mem:/ {
    total=$2;
    used=$3;
    free=$4;
    percent = (used/total)*100;
    printf("Total: %s | Usada: %s | Livre: %s | Uso: %.2f%%\n", total, used, free, percent)
}'
echo ""
echo "Disk usage"
df -h /mnt/c | awk 'NR==2 {
    printf("Total: %s | Usado: %s | Livre: %s | Uso: %s\n", $2, $3, $4, $5)
}'
echo ""
echo "TOP 5 CPU usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""
echo "TOP 5 Memory usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""
