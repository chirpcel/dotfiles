{
  flake.nixosModules.desktop-gtk =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = with pkgs; [
          bibata-cursors
          morewaita-icon-theme
        ];
      };
      programs.dconf = {
        profiles.user = {
          databases = [
            {
              settings = {
                "org/gnome/desktop/interface" = {
                  gtk-theme = "adw-gtk3";
                  cursor-theme = "Bibata-Modern-Ice";
                  icon-theme = "MoreWaita";
                };
              };
            }
          ];
        };
      };
      services.flatpak.packages = [
        "org.gtk.Gtk3theme.adw-gtk3"
        "org.gtk.Gtk3theme.adw-gtk3-dark"
      ];
    };
}
