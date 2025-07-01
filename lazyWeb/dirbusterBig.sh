#!/bin/bash

DIR="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt"
RAFT="/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt"

echo "Enter website with keyword FUZZ (https://domain.com/FUZZ)"

read DOMAIN

sudo ffuf -u $DOMAIN -w $DIR -t 50 






echo "Continue to use raft wordlist?"

sudo ffuf -u $DOMAIN -w $RAFT -t 50 
