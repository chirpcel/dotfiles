{
  flake.nixosModules.core-shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        useBabelfish = true;
      };
      programs.starship = {
        enable = true;
        transientPrompt.enable = true;
      };
      users.defaultUserShell = pkgs.fish;
      stow.packages = [
        "fish"
        "starship"
      ];
    };
}
