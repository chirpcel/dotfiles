{ inputs, ... }:

{
  flake.nixosModules.compositor =
  { pkgs, ... }:
  {
    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
    stow.packages = [ "niri" ];
  };
}
