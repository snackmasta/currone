#!/bin/bash

# Read the new IP address from ip.txt
new_ip=$(host 0.tcp.ap.ngrok.io | grep -oP 'has address \K[^ ]+')

# Read the new port from port.txt
new_port=$(curl localhost:4040/api/tunnels | jq '.tunnels[0].public_url'| awk -F':' '{print $3}'|tr -d '"')

# Create a JSON string with the new IP and port
json_data="{\"ip_address\":\"$new_ip\",\"port\":$new_port}"

# Echo the JSON string to data.json
echo "$json_data" > data.json

echo "Updated data.json with IP: $new_ip and Port: $new_port"
