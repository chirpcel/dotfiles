{
  flake.nixosModules.core-passwords =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        proton-pass-cli
      ];
    };
}
