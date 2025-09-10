#!/bin/bash
set -e

# Add Redis repository GPG key
curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

# Add Redis repository
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" \
  > /etc/apt/sources.list.d/redis.list

# Update apt cache
apt-get update

# Install Redis, Redis tools, and Redis Sentinel (specific version)
apt-get install -y \
  redis=6:8.0.2-1rl1~jammy1 \
  redis-tools=6:8.0.2-1rl1~jammy1 \
  redis-sentinel=6:8.0.2-1rl1~jammy1
