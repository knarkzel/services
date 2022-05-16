#!/usr/bin/env bash

set -Eeuo pipefail

# create basic website
read -p "Domain: " DOMAIN
mkdir -p "/etc/nginx/sites-available"
cp website "/etc/nginx/sites-available/$DOMAIN"
sed -i "s/SERVERNAME/$DOMAIN/g" "/etc/nginx/sites-available/$DOMAIN"
mkdir -p "/var/www/$DOMAIN" && cp index.html "/var/www/$DOMAIN"
mkdir -p /etc/nginx/sites-enabled && ln -s "/etc/nginx/sites-available/$DOMAIN" /etc/nginx/sites-enabled

# setup nginx with ports
cp nginx.conf /etc/nginx
pacman --noconfirm -Sy nginx
systemctl enable --now nginx
ufw allow 80
ufw allow 443

# finish
echo "Created website $DOMAIN at /etc/nginx/sites-enabled/$DOMAIN"
