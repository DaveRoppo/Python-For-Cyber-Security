#!/bin/bash

echo "Started"

# Establish while loop to block IPs that connect to our honeyport on port 1025

while [1]
do
  # Start netcat listener on port 1025
  # Standard error output into /dev/null
  # Output from connection piped into 'grep received'
  # Output from grep piped into awk to retrieve the IP assign to the IP variable
  IP=`nc -nvl 1025 2>&1 > /dev/null | grep received | awk -F '[] []' '{print $3;}'`
  # Use iptables to add rule to drop IP addresses that connect to our honeyport
  iptables -A INPUT -p tcp -s $IP -j DROP
  echo -- $IP has been blocked!
done
