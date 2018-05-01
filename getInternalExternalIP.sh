#!/bin/bash
# Author: Ajaya Kumar Loya
# This script will fetch you public and private IPs of instance.
# Note this need be running on a Instance of which you need Instance ID.
echo
echo "Internal IPs:";
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
echo
echo "External IPs:";
dig +short myip.opendns.com @resolver1.opendns.com;
echo "--------------------"
