{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          ${pkgs.starship}/bin/starship init fish | source
          ${pkgs.fastfetch}/bin/fastfetch
        '';
        useBabelfish = true;
      };
      programs.starship = {
        enable = true;
      };
      users.defaultUserShell = pkgs.fish;
      stow.packages = [
        "fish"
        "starship"
        "fastfetch"
      ];
    };
}
