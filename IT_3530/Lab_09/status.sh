#!/bin/bash
# Phyllis Kan pyk9q7

SERVICE=$1 
ACTIVATED=$2

if [ $# -eq 2 ]
then
	if [ $ACTIVATED == start ]
	then 
		echo "Starting $SERVICE service"
		systemctl start $SERVICE
	elif [ $ACTIVATED == stop ]
	then
		echo "Stopping $SERVICE service"
		systemctl stop $SERVICE
	else
		echo "bad second param"
		echo "Invalid option "$ACTIVATED" (must be "start" or "stop")"
	fi
fi

SERVICE_STATUS="systemctl status $SERVICE" 
if $SERVICE_STATUS | grep -i "exited" 
then
	stopinfo="$USER $(date) The $SERVICE service is stopped"
	echo service is installed but stopped
       	echo $stopinfo >> /tmp/services.logs	
elif $SERVICE_STATUS | grep -i "running" 
then
	runinfo="$USER $(date) The $SERVICE service is running"
	echo service is running
       	echo $runinfo >> /tmp/services.logs	
else
	ninstalled="$USER $(date) The service $SERVICE is not installed"
	echo service not found
       	echo $ninstalled >> /tmp/services.logs
fi

