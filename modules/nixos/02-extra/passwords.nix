{
  flake.nixosModules.extra-passwords =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        proton-pass-cli
      ];
    };
}
