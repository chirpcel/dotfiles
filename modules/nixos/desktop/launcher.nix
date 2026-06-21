{
  flake.nixosModules.launcher =
    { pkgs, ... }:
    {
      systemd.user.services."anyrun" = {
        description = "Anyrun daemon";
        partOf = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.anyrun}/bin/anyrun daemon";
          Restart = "on-failure";
          RestartSec = 2;
        };
      };
      stow.packages = [ "anyrun" ];
      environment.systemPackages = with pkgs; [
        anyrun
      ];
      systemd.tmpfiles.rules = [
        "L /var/lib/anyrun/plugins/libapplications.so - - - - ${pkgs.anyrun}/lib/libapplications.so"
        "L /var/lib/anyrun/plugins/libniri_focus.so - - - - ${pkgs.anyrun}/lib/libniri_focus.so"
        "L /var/lib/anyrun/plugins/libsymbols.so - - - - ${pkgs.anyrun}/lib/libsymbols.so"
      ];
    };
}
