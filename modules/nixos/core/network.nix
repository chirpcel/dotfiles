{
  flake.nixosModules.network = {
    systemd.network = {
      enable = true;
    };
    networking = {
      useNetworkd = true;
      wireguard = {
        enable = true;
        useNetworkd = true;
      };
    };
  };
}
