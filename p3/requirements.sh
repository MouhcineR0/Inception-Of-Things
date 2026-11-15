#!/usr/bin/bash

set -euo pipefail

# -- docker --
if ! command -v docker >/dev/null 2>&1; then
	sudo apt update
	sudo apt install -y curl ca-certificates
	curl -fsSL https://get.docker.com -o docker.sh
	sudo sh docker.sh
fi

# by default docker binds unix socket instead of tcp port so we should grand privilage to current $USER
sudo usermod -aG docker $USER


# --- kubectl ---
if ! command -v kubectl >/dev/null 2>&1; then
	sudo snap install kubectl --classic
fi


# --- k3d ---
if ! command -v k3d >/dev/null 2>&1; then
	curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi
