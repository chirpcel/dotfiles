{
  flake.nixosModules.desktop-terminal =
    { pkgs, ... }:
    {
      services.flatpak = {
        packages = [
          "app.devsuite.Ptyxis"
        ];
        overrides."app.devsuite.Ptyxis".Context = {
          devices = [ "all" ];
        };
      };
    };
}
