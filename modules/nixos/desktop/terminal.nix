{
  flake.nixosModules.terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty
      ];
      stow.packages = [ "ghostty" ];
    };
}
