{
  flake.nixosModules.core-fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          adwaita-fonts
          openmoji-color
          nerd-fonts.symbols-only
        ];
        enableDefaultPackages = false;
        fontconfig = {
          enable = true;
          defaultFonts = {
            emoji = [ "OpenMoji Color" ];
            monospace = [ "Adwaita Mono" ];
            sansSerif = [ "Adwaita Sans" ];
          };
        };
      };
    };
}
