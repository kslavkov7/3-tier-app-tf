#!/bin/bash

# 1. Update OS
apt update -y

# 2. Install Docker
apt install docker.io -y

# 3. Enable Docker
systemctl start docker
systemctl enable docker

# 4. Pull frontend image from Docker Hub
docker pull kslavkov7/3tier-app-tf:frontend

# 5. Run frontend container
docker run -d --name frontend -p 80:80 kslavkov7/3tier-app-tf:frontend
