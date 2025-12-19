#!/bin/bash

# 1. Update OS
apt update -y && apt upgrade -y

# 2. Install Docker
apt install -y docker.io

# 3. Enable and start Docker service
systemctl enable docker
systemctl start docker

# 4. Pull frontend image from Docker Hub
docker pull kslavkov7/3tier-app-tf:frontend

# 5. Create systemd service for frontend container
cat <<EOF > /etc/systemd/system/frontend.service
[Unit]
Description=Frontend Docker Container
After=docker.service
Requires=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run --name frontend -p 80:80 --rm kslavkov7/3tier-app-tf:frontend
ExecStop=/usr/bin/docker stop frontend

[Install]
WantedBy=multi-user.target
EOF

# 6. Enable and start the frontend service
systemctl daemon-reload
systemctl enable frontend.service
systemctl start frontend.service
