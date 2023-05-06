#!/bin/sh

logger "Enabling performance governor for gpu"

echo "performance" > /sys/class/devfreq/1c40000.gpu/governor 
