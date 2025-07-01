#!/bin/bash

PARAMS="/usr/share/seclists/Discovery/Web-Content/raft-small-words-lowercase.txt"

echo "FUZZ is automatically appended at the end" 
echo "Enter a URL to FUZZ parameters: (https://www.domain.com/)"

read TARGET

sudo ffuf -u "$TARGET/?FUZZ=id" -w $PARAMS -t 50 -fs 0