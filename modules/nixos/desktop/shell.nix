{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      systemd.user.services = {
        "ironbar" = {
          description = "Ironbar";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.ironbar}/bin/ironbar";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
      };
      stow.packages = [ "ironbar" ];
    };
}
