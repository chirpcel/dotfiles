{
  flake.nixosModules.development-virtualisation = {
    services.flatpak.packages = [
      "com.github.marhkb.Pods"
      "org.gnome.Boxes"
    ];
    virtualisation.podman.enable = true;
    programs.fish.interactiveShellInit = ''
      export CONTAINER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"
    '';
  };
}
