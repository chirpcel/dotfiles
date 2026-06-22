{
  flake.nixosModules.desktop-gtk =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = with pkgs; [
          adw-gtk3
          bibata-cursors
        ];
      };
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
