#!/usr/bin/env bash 

#bin bash for popular linux distro. im on nixos.

# Set limit
THRESHOLD=5

# % system disk
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

Botid=              # BOT API KEY
chatid=             # YOU CHAT ID FOR ALERT

# echo and tg https alert
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Warning: Disk usage is at ${USAGE}% on $(hostname)" | curl -s -X POST "https://api.telegram.org/bot$Botid/sendMessage" \
     -d chat_id=$chatid \
     -d text="Warning: Disk usage is at ${USAGE}% on $(hostname)" 
fi
