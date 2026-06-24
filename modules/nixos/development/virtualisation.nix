{
  flake.nixosModules.development-virtualisation = {
    services.flatpak.packages = [
      "com.github.marhkb.Pods"
      "org.gnome.Boxes"
    ];
    virtualisation.podman.enable = true;
  };
}
