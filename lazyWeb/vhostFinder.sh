#!/bin/bash

DOMAINS="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"

echo -n "Enter domain (e.g., FUZZ.domain.com): "
read TARGET

BASE_DOMAIN=$(echo "$TARGET" | sed 's/FUZZ\.//')

echo -n "Enter IP address of the target (e.g., 1.2.3.4): "
read IP

if ! command -v gobuster &> /dev/null
then
    echo "[-] Gobuster is not installed. Install it first."
    exit 1
fi

echo "[*] Running gobuster vhost scan against $TARGET ($IP)..."

sudo gobuster vhost -u "http://$IP" -w "$DOMAINS" -t 50 -H "Host: FUZZ.$BASE_DOMAIN"

# sudo gobuster vhost -u "http://$IP" -w "$DOMAINS" -t 50 -H "Host: FUZZ.$BASE_DOMAIN" -o vhost_results.txt

#-c to include a cookie
