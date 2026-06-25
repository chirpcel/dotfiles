{
  flake.nixosModules.extra-vpn =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        proton-vpn-cli
      ];
    };
}
