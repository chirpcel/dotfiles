{ config, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      imports = with config.flake.nixosModules; [
        desktop-browser
        desktop-flatpak
        desktop-gtk
        desktop-keyboard
        desktop-proton
        desktop-security
        desktop-splash
        desktop-terminal
      ];
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome = {
          enable = true;
          sessionPath = with pkgs; [
            gnomeExtensions.blur-my-shell
            gnomeExtensions.paperwm
            gnomeExtensions.dash-to-dock
            gnomeExtensions.clipboard-indicator
          ];
        };
        gnome = {
          core-apps.enable = false;
        };
      };
      environment = {
        systemPackages = with pkgs; [ nautilus ];
        gnome.excludePackages = with pkgs; [ gnome-tour ];
      };
    };
}
