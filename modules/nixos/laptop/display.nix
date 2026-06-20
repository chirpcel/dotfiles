{
  flake.nixosModules.display =
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];
  };
}
