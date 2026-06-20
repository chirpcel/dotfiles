{
  flake.nixosModules.git = {
    programs.git = {
      enable = true;
    };
    stow.packages = [ "git" ];
  };
}
