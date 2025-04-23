#!/bin/bash

URL="http://localhost:5000"
LOGFILE="healthcheck.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

if curl --silent --fail "$URL" > /dev/null; then
    echo "$TIMESTAMP ✅ App is running" >> "$LOGFILE"
else
    echo "$TIMESTAMP ❌ App is NOT responding" >> "$LOGFILE"
fi

