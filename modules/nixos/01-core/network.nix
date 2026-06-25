{
  flake.nixosModules.core-network = {
    networking = {
      networkmanager.enable = true;
      nftables.enable = true;
    };
  };
}
