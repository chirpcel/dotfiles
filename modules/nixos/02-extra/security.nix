{ inputs, ... }:
{
  flake.nixosModules.extra-security =
    { config, ... }:
    {
      imports = [
        inputs.lanzaboote.nixosModules.lanzaboote
      ];
      security = {
        rtkit.enable = true;
        sudo.enable = false;
        polkit.enable = true;
        run0.enable = true;
      };
      services.pcscd = {
        enable = true;
      };
      security.pam.services = {
        login.u2fAuth = false;
        login.fprintAuth = false;
        su.u2fAuth = false;
        su.fprintAuth = false;
      };
      security.pam.u2f = {
        enable = true;
        settings = {
          cue = true;
          authfile = config.age.secrets.u2f-authfile.path;
        };
      };
      services.usbguard = {
        enable = true;
        IPCAllowedGroups = [ "wheel" ];
      };
    };
}
