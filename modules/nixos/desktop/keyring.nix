{ self, ... }:
{
  flake.nixosModules.keyring =
    { lib, pkgs, ... }:
    {
      services.gnome.gnome-keyring.enable = false;
      security.pam.services.greetd.rules = {
        auth.unix.control = lib.mkForce "required";
        auth.oo7 = {
          order = 12000;
          control = "optional";
          modulePath = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-full}/lib/security/pam_oo7.so";
        };
        auth.permit = {
          order = 12400;
          control = "sufficient";
          modulePath = "${pkgs.linux-pam}/lib/security/pam_permit.so";
        };
        session.oo7 = {
          order = 15000;
          control = "optional";
          modulePath = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-full}/lib/security/pam_oo7.so";
          args = [ "auto_start" ];
        };
      };
      systemd.user.services = {
        "oo7-daemon" = {
          description = "oo7 Secret Service Daemon";
          wantedBy = [ "default.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-full}/bin/oo7-daemon --login";
            Restart = "on-failure";
            RestartSec = 2;
            NoNewPrivileges = true;
            SupplementaryGroups = "";
            PrivateUsers = true;
            ProtectSystem = "full";
            PrivateTmp = true;
            PrivateDevices = true;
            PrivateNetwork = true;
            ProtectKernelTunables = true;
            ProtectKernelModules = true;
            ProtectControlGroups = true;
            MemoryDenyWriteExecute = true;
            ProtectClock = true;
          };
        };
        "oo7-portal" = {
          description = "oo7 Secret Service Portal";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "dbus";
            BusName = "org.freedesktop.impl.portal.desktop.oo7";
            ExecStart = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-full}/bin/oo7-portal";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
      };
    };
}
