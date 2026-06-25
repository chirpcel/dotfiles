{
  flake.nixosModules.development-gnupg = {
    programs.gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    services.gnome.gcr-ssh-agent.enable = false;
    stow.packages = [ "gnupg" ];
  };
}
