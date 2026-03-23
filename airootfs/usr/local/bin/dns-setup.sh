#!/bin/bash

# Ask the user for DNS
echo "Enter your preferred DNS (e.g., 1.1.1.1). Press Enter to use default (8.8.8.8):"
read -r user_dns

# Set default if empty
if [ -z "$user_dns" ]; then
    user_dns="8.8.8.8"
fi

# Create the temporary resolv.conf
echo "nameserver $user_dns" > /tmp/custom_resolv.conf
echo "nameserver 8.8.4.4" >> /tmp/custom_resolv.conf

echo "DNS configured to $user_dns"
