#!/usr/bin/env bash

set -Eeuo pipefail

# run certbot
pacman --noconfirm -Sy certbot certbot-nginx
ufw allow 80
ufw allow 443
certbot --nginx
(crontab -l 2>/dev/null; echo "0 0 1 * * certbot --nginx renew") | crontab -
