curl -sfL https://get.k3s.io | sh -s - --flannel-backend wireguard-native --secrets-encryption --cluster-cidr=10.42.0.0/16,2001:cafe:42::/56 --service-cidr=10.43.0.0/16,2001:cafe:43::/112 --flannel-ipv6-masq