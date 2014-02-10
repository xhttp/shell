#!/bin/bash
# Check Memcached Process
# Copy @ Chuanwen Chen 2013/8/27

TARGET='/home/work/lamp/memcached/bin/memcached -d -m 4096 -l 192.168.0.1 -p 11211 -c 8192 -u root'
INTERVAL=5
while true
do
    pid=`/bin/ps -ef | grep 'memcached -d' | grep 11211 | grep -v grep | awk '{print $2}'`
    if [ -n "$pid" ]; then 
        echo $pid
    else    
        $TARGET 
    fi
    sleep $INTERVAL
done
