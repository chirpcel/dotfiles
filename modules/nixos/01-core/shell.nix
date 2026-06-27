{
  flake.nixosModules.core-shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        useBabelfish = true;
      };
      environment.systemPackages = with pkgs; [
        fishPlugins.hydro
      ];
      users.defaultUserShell = pkgs.fish;
      stow.packages = [
        "fish"
      ];
    };
}
