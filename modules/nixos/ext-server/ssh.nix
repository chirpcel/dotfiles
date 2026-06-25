{
  flake.nixosModules.server-ssh = {
    services.openssh = {
      startWhenNeeded = false;
      openFirewall = true;
    };
  };
}
