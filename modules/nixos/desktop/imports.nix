{ config, ... }:
{
  flake.nixosModules.desktop.imports = with config.flake.nixosModules; [
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
    shell
    splash
    terminal
  ];
}
