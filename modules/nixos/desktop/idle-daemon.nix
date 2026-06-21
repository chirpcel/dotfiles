{
  flake.nixosModules.idle-daemon =
    { pkgs, ... }:
    {
      systemd.user.services."stasis" = {
        description = "Stasis Wayland Idle Manager";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        enableDefaultPath = false;
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.stasis}/bin/stasis";
          ExecReload = "${pkgs.stasis}/bin/stasis reload";
          Restart = "always";
          RestartSec = 2;
        };
      };
      stow.packages = [ "stasis" ];
    };
}
