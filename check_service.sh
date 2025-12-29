#!/bin/bash
# check_service.sh
# Checks if a service is running and restarts it if not

SERVICE="ssh"

if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is not running. Restarting..."
    sudo systemctl start $SERVICE
fi
