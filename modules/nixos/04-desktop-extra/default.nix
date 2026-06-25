{ config, ... }:
{
  flake.nixosModules.desktop-extra.imports = with config.flake.nixosModules; [
    desktop
    desktop-audio-player
    desktop-calendar
    desktop-contacts
    desktop-disk-info
    desktop-document-viewer
    desktop-file-sharing
    desktop-picture-viewer
    desktop-proton
    desktop-text-editor
    desktop-video-player
  ];
}
