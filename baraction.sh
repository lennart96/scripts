#!/bin/sh
while true
do
    free -h | awk '$1 ~ /Mem/ { printf("  %s", $3); }'
    echo -n '  -'
    df -h | awk '$6=="/"||$6=="/home" {printf("  %s", $4);}'
    echo -n '  -  '
    echo -n $(ip addr show wlp2s0 scope global up | grep inet | cut -d' ' -f6)
    echo -n '  '
    echo -n $(nmcli -t -f GENERAL.CONNECTION d sh wlp2s0 | cut -d':' -f2)
    echo -n '  -  '
    echo -n $(dropbox status)
    echo -n '  -  '
    echo -n $(cat /sys/class/power_supply/BAT0/capacity)%
    echo -n '  -  '
    echo -n $(date +"%s  %Y-%m-%d %T %Z")
    echo -n '  -  '
    echo -n $(ps h -u "$USER" o 'comm' --sort '-pmem' | head -n 7)
    echo
    sleep 1
done
