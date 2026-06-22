{
  flake.nixosModules.vcs = {
    programs.git = {
      enable = true;
    };
    stow.packages = [ "git" ];
  };
}
