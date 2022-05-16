#!/usr/bin/env bash

set -Eeuo pipefail

# remove basic website
ls /etc/nginx/sites-available
read -p "Domain: " DOMAIN
rm -r "/etc/nginx/sites-available/$DOMAIN" "/var/www/$DOMAIN" "/etc/nginx/sites-available/$DOMAIN" "/etc/nginx/sites-enabled/$DOMAIN"

# disable nginx and ports
pacman --noconfirm -R nginx
systemctl disable --now nginx
ufw deny 80
ufw deny 443

# finish
echo "Remove website $DOMAIN from /etc/nginx/sites-enabled/$DOMAIN"

