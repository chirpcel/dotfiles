{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          nerd-fonts.monaspace
          openmoji-color
        ];
        fontconfig = {
          enable = true;
          defaultFonts = {
            emoji = [
              "OpenMoji Color"
            ];
            monospace = [
              "MonaspiceKr Nerd Font Propo"
            ];
            sansSerif = [
              "MonaspiceAr Nerd Font Propo"
            ];
            serif = [
              "MonaspiceXe Nerd Font Propo"
            ];
          };
        };
      };
    };
}
