{
  flake.nixosModules.server = {
    imports = with flake.nixosModules; [
      server-ssh
    ];
  };
}
