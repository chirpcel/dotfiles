{ inputs, ... }:

{
  perSystem = { config, pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = [
        pkgs.disko
      ];
    };
  };
}
