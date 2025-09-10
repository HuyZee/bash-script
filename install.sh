#!/bin/bash
set -e

# Update and install required packages
apt update && apt -y install ca-certificates wget net-tools gnupg

# Add OpenVPN Access Server repo key
mkdir -p /etc/apt/keyrings
wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/keyrings/as-repository.asc

# Add repository to sources list
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/as-repository.asc] http://as-repository.openvpn.net/as/debian jammy main" \
  > /etc/apt/sources.list.d/openvpn-as-repo.list

# Update and install OpenVPN-AS
apt update && apt -y install openvpn-as
