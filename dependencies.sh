#!/usr/bin/bash

echo "installing initial packages ..."
sudo apt update && sudo apt install build-essential procps curl file git virtualbox vim -y

echo "curling vagrant(hashicorp) ...."

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
VER=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/vagrant | grep -o '"current_version":"[^"]*"' | cut -d'"' -f4)
echo "$VER"

echo "hashicorp vagrant version problem updated !\n installing vagrant"

wget https://releases.hashicorp.com/vagrant/${VER}/vagrant_${VER}-1_amd64.deb
sudo apt install -y ./vagrant_${VER}-1_amd64.deb
sudo apt install -y vagrant
