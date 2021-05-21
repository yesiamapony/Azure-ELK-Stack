#!/bin/bash
DATE=`date '+%F  %H:%M:%S'`
OS=`uname`
IP=`hostname -I | awk '{print $1}'`
HOSTNAME=`hostname`

echo 'System Info V1.0 ' $DATE
echo 'System:   ' $OS
echo 'IP Addr:  ' $IP
echo 'Hostname: ' $HOSTNAME
