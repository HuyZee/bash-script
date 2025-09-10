#!/bin/bash
set -e

# Install prerequisites
apt-get update
apt-get install -y lsb-release curl gpg

# Add Redis GPG key
curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg

# Add Redis repository
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" \
  > /etc/apt/sources.list.d/redis.list

# Update package index
apt-get update

# Install Redis (latest available from repo)
apt-get install -y redis
