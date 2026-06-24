{
  flake.nixosModules.desktop-text-editor = {
    services.flatpak.packages = [
      "org.gnome.TextEditor"
    ];
  };
}