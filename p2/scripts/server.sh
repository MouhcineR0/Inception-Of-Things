#!/bin/bash

curl -fsSL https://get.k3s.io | INSTALL_K3S_EXEC="server \
  --node-ip 192.168.56.110 \
  --flannel-iface enp0s8 \
  --write-kubeconfig-mode 644" sh -
