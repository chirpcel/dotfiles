{ config, ... }:
{
  flake.nixosModules.desktop.imports = with config.flake.nixosModules; [
    audio
    browser
    compositor
    flatpak
    greeter
    keyboard
    splash
    terminal
  ];
}
