#!/usr/bin/env bash

set -Eeuo pipefail

# remove certbot
pacman --noconfirm -R certbot certbot-nginx
