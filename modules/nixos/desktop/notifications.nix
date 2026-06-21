{ inputs, ... }:
{
  flake.nixosModules.notifications =
    { pkgs, ... }:
    {
      systemd.user.services."swaync" = {
        description = "SwayNotificationCenter";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
          Restart = "on-failure";
          RestartSec = 2;
        };
      };
      stow.packages = [
        "swaync"
      ];
    };
}
