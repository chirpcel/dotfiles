{
  flake.nixosModules.development-vcs = {
    programs.git = {
      enable = true;
    };
    stow.packages = [ "git" ];
  };
}
