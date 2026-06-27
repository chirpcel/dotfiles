{ config, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      imports = with config.flake.nixosModules; [
        extra
        desktop-browser
        desktop-flatpak
        desktop-gtk
        desktop-security
        desktop-terminal
      ];
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome = {
          enable = true;
          sessionPath = with pkgs; [
            imagemagick
            gnomeExtensions.kiwi-is-not-apple
            gnomeExtensions.dash-to-dock
            gnomeExtensions.light-style
            gnomeExtensions.clipboard-indicator
          ];
        };
        gnome = {
          core-apps.enable = false;
        };
      };
      environment = {
        systemPackages = with pkgs; [ nautilus ];
        gnome.excludePackages = with pkgs; [
          gnome-tour
        ];
      };
      stow.packages = [ "user-dirs" ];
    };
}
