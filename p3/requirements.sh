#!/usr/bin/bash


# -- docker --
sudo apt install -y curl ca-certificates

curl -fsSL https://get.docker.com -o docker.sh

sudo sh docker.sh

# by default docker binds unix socket instead of tcp port so we should grand privilage to current $USER
sudo usermod -aG docker $USER

# refresh process
newgrp docker

# --- kubectl ---

sudo snap install kubectl --classic


# --- k3d ---
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
