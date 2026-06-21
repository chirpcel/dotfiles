{
  flake.nixosModules.gtk =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = with pkgs; [
          adw-gtk3
          adwaita-icon-theme
          bibata-cursors
        ];
      };
      environment.variables.XCURSOR_THEME = "Bibata-Modern-Ice";
      programs.dconf = {
        profiles.user = {
          databases = [
            {
              settings = {
                "org/gnome/desktop/interface" = {
                  color-scheme = "prefer-dark";
                  gtk-theme = "adw-gtk3-dark";
                  cursor-theme = "Bibata-Modern-Ice";
                };
              };
            }
          ];
        };
      };
    };
}
