{
  flake.nixosModules.desktop-terminal =
    { pkgs, ... }:
    {
      services.flatpak = {
        packages = [
          "app.devsuite.Ptyxis"
        ];
      };
    };
}
