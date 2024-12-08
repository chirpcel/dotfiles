curl -sfL https://get.k3s.io | sh -s - agent --server https://${K3S_SERVER_HOST}:6443 --token ${K3S_AGENT_TOKEN}
