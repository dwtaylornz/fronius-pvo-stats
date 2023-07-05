#!/bin/bash

# check vars
if [ -z "$pvOutputSID" ]; then
    echo "We need pvOutputSID variable set"
    exit 1 
fi
if [ -z "$pvOutputApiKEY" ]; then
    echo "We need pvOutputApiKEY variable set"
    exit 1
fi
if [ -z "$dataManagerIP" ]; then
    echo "We need dataManagerIP variable set"
    exit 1
fi
if [ -z "$delay" ]; then
    delay=120
fi 

# main loop
while true
do 
    php fronius.php
    sleep "$delay"
done