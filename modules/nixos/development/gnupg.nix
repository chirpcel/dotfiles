{
  flake.nixosModules.gnupg = {
    programs.gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    stow.packages = [ "gnupg" ];
  };
}
