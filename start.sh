#!/bin/sh
set -e
echo 'Build image locally and push to Nexus'
sh push-image.sh
sleep 5
echo 'Run compose'
docker compose up -d