{
  flake.nixosModules.core-proton =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        proton-vpn-cli
        proton-pass-cli
      ];
    };
}
