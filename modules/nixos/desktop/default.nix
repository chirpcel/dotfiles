{ config, ... }:
{
  flake.nixosModules.desktop = {
    imports = with config.flake.nixosModules; [
      desktop-browser
      desktop-flatpak
      desktop-gtk
      desktop-keyboard
      desktop-splash
      desktop-terminal
    ];
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome = {
        core-apps.enable = false;
      };
    };
  };
}
