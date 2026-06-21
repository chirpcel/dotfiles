{
  flake.nixosModules.osd =
    { pkgs, ... }:
    {
      systemd.user.services."swayosd-server" = {
        description = "SwayOSD server";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
          Restart = "on-failure";
          RestartSec = 2;
        };
      };
      stow.packages = [ "stasis" ];
      environment.systemPackages = with pkgs; [
        swayosd
      ];
    };
}
