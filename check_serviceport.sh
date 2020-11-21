#!/bin/bash
SERVICE_OK=0
SERVICE_WARNING=1
SERVICE_CRITICAL=2
SERVICE_UNKNOWN=3

if [ $# -ne 2 ];then
   echo  "$1: Usage: service.sh  ServiceName  PortNo"
   echo  "Please enter correct argument:"
   exit $SERVICE_WARNING
fi

S=$1
P=$2
C=$3
w=$4
PROCESS=`netstat -ant | awk '$6 == "LISTEN" && $4 ~ /[\.:]'$P'$/'|wc -l`
#PROCESS=`netstat -ant | awk '$6 == "LISTEN" && $4 ~ /[\.:]:'$P'$/'|wc -l`

#if [ "$PROCESS" -eq 1 ];then
if [ "$PROCESS" -gt 0 ];then
   echo "$S Service is running on Port $P"
   exit $SERVICE_OK

else
   echo "$S Service is not runnint on Port $P"
   exit $SERVICE_CRITICAL
fi
