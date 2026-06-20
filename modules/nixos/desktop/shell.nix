{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      systemd.user.services = {
        "wpaperd" = {
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
        "ironbar" = {
          description = "Ironbar";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          path = with pkgs; [ bash systemd upower gawk gnugrep iwd ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.ironbar}/bin/ironbar";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
      };
      stow.packages = [ "wpaperd" "ironbar" ];
    };
}
