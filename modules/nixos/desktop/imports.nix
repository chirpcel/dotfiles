{ config, ... }:
{
  flake.nixosModules.desktop.imports = with config.flake.nixosModules; [
    ankylo
    audio
    browser
    compositor
    dbus
    dconf
    flatpak
    greeter
    gtk
    keyboard
    keyring
    polkit
    shell
    splash
    terminal
  ];
}
