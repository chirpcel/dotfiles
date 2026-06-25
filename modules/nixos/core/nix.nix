{
  flake.nixosModules.core-nix =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.extraOptions = ''
        !include ${config.age.secrets.nix-access-tokens.path}
      '';
      age.secrets.nix-access-tokens = {
        mode = "770";
        group = "users";
      };
      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "textual-speedups"
          "proton-pass-cli"
        ];
      documentation.enable = false;
    };
}
