#!/bin/bash
set -eux

curl -sfL https://get.k3s.io | sh -

echo "K3s installed."
