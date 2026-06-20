{ inputs, ... }:

{
  perSystem = { config, pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = [
        pkgs.disko
        config.agenix-rekey.package
        pkgs.rage
        pkgs.age-plugin-yubikey
      ];
    };
  };
}
