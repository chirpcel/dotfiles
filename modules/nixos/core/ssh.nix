{
  flake.nixosModules.core-ssh = {
    services.openssh = {
      enable = true;
      startWhenNeeded = true;
      openFirewall = true;
      hostKeys = [
        {
          path = "/etc/ssh/ssh_host_key";
          type = "ed25519";
        }
      ];
    };
  };
}
