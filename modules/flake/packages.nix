{
  perSystem = { config, pkgs, ... }: {
    packages.oo7-pam = pkgs.callPackage ../../packages/oo7-pam/package.nix { };
  };
}
