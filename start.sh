#!/bin/sh
while true
do
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"
java -Xms240M -Xmx3G -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=4M -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AggressiveOpts -jar airplane.jar -o false nogui
echo "You have 10 seconds untill the server reboot again press CTRL-C to stop process"
sleep 10
done
