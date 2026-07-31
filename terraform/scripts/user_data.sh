#!/bin/bash
set -eux

echo "========== CloudOps Bootstrap Started =========="

bash /tmp/install_cloudwatch_agent.sh

bash /tmp/install_docker.sh

bash /tmp/install_helm.sh

bash /tmp/install_k3s.sh

echo "========== Bootstrap Complete =========="
