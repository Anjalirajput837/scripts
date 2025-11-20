#!/bin/bash
THRESHOLD=80

MOUNT_POINT="/c"

USAGE=$(df -h | awk -v mount="$MOUNT_POINT" '$6 == mount {print $5}' | sed 's/%//g')

echo "The usage percentage for $MOUNT_POINT is: $USAGE"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage on / is at ${USAGE}% on $(hostname)!"
    
else
    echo "Disk usage is normal (${USAGE}%)."
fi

