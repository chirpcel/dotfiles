{
  flake.nixosModules.development-vcs = {
    programs.git = {
      enable = true;
    };
    services.flatpak = {
      packages = [
       "de.wwwtech.gitte"
      ];
    };
    stow.packages = [ "git" ];
  };
}
