{
  flake.nixosModules.desktop-terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty
      ];
      xdg.terminal-exec = {
        enable = true;
        settings = {
          default = [
            "ghostty.desktop"
          ];
        };
      };
      stow.packages = [ "ghostty" ];
    };
}
