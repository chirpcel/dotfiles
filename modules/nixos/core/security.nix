{ inputs, ... }:
{
  flake.nixosModules.security =
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
        run0.enableSudoAlias = true;
      };
      services.pcscd = {
        enable = true;
      };
      security.pam.services = {
        login.u2fAuth = false;
        login.fprintAuth = false;
        su.u2fAuth = false;
      };
      services.usbguard = {
        enable = true;
        dbus.enable = true;
        ruleFile = config.age.secrets.usbguard-rules.path;
        IPCAllowedGroups = [ "wheel" ];
        presentDevicePolicy = "apply-policy";
        presentControllerPolicy = "apply-policy";
        insertedDevicePolicy = "apply-policy";
        implicitPolicyTarget = "block";
      };
    };
}
