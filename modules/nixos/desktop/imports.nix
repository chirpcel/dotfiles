{ config, ... }:
{
  flake.nixosModules.desktop.imports = with config.flake.nixosModules; [
    ankylo
    audio
    bar
    browser
    compositor
    dbus
    dconf
    flatpak
    greeter
    gtk
    idle-daemon
    keyboard
    keyring
    launcher
    notifications
    osd
    polkit
    splash
    terminal
    wallpaper
  ];
}
