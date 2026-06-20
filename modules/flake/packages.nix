{
  perSystem = { config, pkgs, ... }: {
    packages.oo7-full = pkgs.callPackage ../../packages/oo7-full/package.nix { };
  };
}
