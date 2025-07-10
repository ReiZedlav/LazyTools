#!/bin/bash

COMMON="/usr/share/wordlists/dirb/common.txt"

DIR="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt"
RAFT="/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt"

echo "Enter website with keyword FUZZ (https://domain.com/FUZZ)"

read DOMAIN

sudo ffuf -u $DOMAIN -w $COMMON -t 50 -e .php,.txt,.html,.zip

echo "Continue to big.txt?"

read SKIP

sudo ffuf -u $DOMAIN -w $DIR -t 50 -e .php,.txt,.html,.zip 

echo "Continue to use raft wordlist?"

read SKIP2

sudo ffuf -u $DOMAIN -w $RAFT -t 50 -e .php,.txt,.html,.zip
