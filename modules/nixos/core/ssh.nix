{
  flake.nixosModules.core-ssh =
    { lib, ... }:
    {
      services.openssh = {
        enable = true;
        startWhenNeeded = lib.mkDefault true;
        openFirewall = lib.mkDefault false;
        hostKeys = [
          {
            path = "/etc/ssh/ssh_host_key";
            type = "ed25519";
          }
        ];
      };
    };
}
