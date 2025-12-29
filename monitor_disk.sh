#!/bin/bash
# monitor_disk.sh
# Monitors disk usage and alerts if usage exceeds a threshold

THRESHOLD=${1:-80}
PARTITION="/"

USAGE=$(df -h $PARTITION | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage on $PARTITION is at ${USAGE}%"
    exit 1
else
    echo "OK: Disk usage on $PARTITION is at ${USAGE}%"
    exit 0
fi

