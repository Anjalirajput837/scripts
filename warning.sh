THRESHOLD=50

MOUNT_POINT="/"


USAGE_STR=$(df -h | awk -v mount="$MOUNT_POINT" '$7 == mount {print $6}' |  sed 's/%//')


echo "The usage percentage for $MOUNT_POINT is: $USAGE_STR % "

if [ "$USAGE_STR" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage on $MOUNT_POINT is at ${USAGE_STR}% on $(hostname)!"

else
    echo "Disk usage is normal (${USAGE_STR}%)."
fi
