{
  flake.nixosModules.gtk =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = with pkgs; [
          adw-gtk3
        ];
        etc."gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-theme-name=adw-gtk3-dark
            gtk-application-prefer-dark-theme=1
          '';
      };
    };
}
