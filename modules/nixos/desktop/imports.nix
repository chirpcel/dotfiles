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
    keyboard
    keyring
    shell
    splash
    terminal
  ];
}
