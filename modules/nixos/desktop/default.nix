{ config, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      imports = with config.flake.nixosModules; [
        desktop-audio-player
        desktop-browser
        desktop-calendar
        desktop-contacts
        desktop-disk-info
        desktop-document-viewer
        desktop-file-sharing
        desktop-flatpak
        desktop-gtk
        desktop-keyboard
        desktop-picture-viewer
        desktop-proton
        desktop-security
        desktop-splash
        desktop-terminal
        desktop-text-editor
        desktop-video-player
      ];
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome = {
          enable = true;
          sessionPath = with pkgs; [
            gnomeExtensions.dash-to-dock
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
