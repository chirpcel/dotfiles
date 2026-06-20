{
  flake.nixosModules.dconf = {
    programs.dconf = {
      enable = true;
      profiles.user = {
        databases = [
          {
            settings = {
              "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
              };
              "org/gnome/desktop/wm/preferences" = {
                button-layout = "appmenu:";
              };
            };
          }
        ];
      };
    };
  };
}
