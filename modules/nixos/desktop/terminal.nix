{
  flake.nixosModules.desktop-terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty
      ];
      stow.packages = [ "ghostty" ];
    };
}
