{
  flake.nixosModules.nix =
    { config, ... }:
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
    };
}
