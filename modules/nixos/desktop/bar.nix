{
  flake.nixosModules.bar =
    { pkgs, ... }:
    {
      systemd.user.services."ironbar" = {
        description = "Ironbar";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        enableDefaultPath = false;
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.ironbar}/bin/ironbar";
          Restart = "on-failure";
          RestartSec = 2;
        };
      };
      stow.packages = [ "ironbar" ];
    };
}
