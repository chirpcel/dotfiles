{
  flake.nixosModules.wallpaper =
    { pkgs, ... }:
    {
      systemd.user.services."wpaperd" = {
        description = "wpaperd";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.wpaperd}/bin/wpaperd";
          Restart = "on-failure";
          RestartSec = 2;
        };
      };
      stow.packages = [ "wpaperd" ];
    };
}
