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
          modulePath = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-pam}/lib/libpam_oo7.so";
        };
        auth.permit = {
          order = 12400;
          control = "sufficient";
          modulePath = "${pkgs.linux-pam}/lib/security/pam_permit.so";
        };
        session.oo7 = {
          order = 15000;
          control = "optional";
          modulePath = "${self.packages.${pkgs.stdenv.hostPlatform.system}.oo7-pam}/lib/libpam_oo7.so";
          args = [ "auto_start" ];
        };
      };
      systemd.user.services = {
        "oo7-daemon" = {
          description = "oo7 Secret Service Daemon";
          wantedBy = [ "default.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.oo7-server}/libexec/oo7-daemon --login";
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
      };
      xdg.portal = {
        config.niri."org.freedesktop.impl.portal.Secret" = lib.mkForce "oo7-portal";
        extraPortals = with pkgs; [ oo7-portal ];
      };
    };
}
