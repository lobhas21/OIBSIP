#!/bin/bash

# Set default firewall policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Deny HTTP
sudo ufw deny http

# Allow HTTPS
sudo ufw allow https

# Deny FTP
sudo ufw deny 21/tcp

# Enable UFW
sudo ufw --force enable

# Display firewall status
sudo ufw status verbose
                                    