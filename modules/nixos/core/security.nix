{ inputs, ... }:
{
  flake.nixosModules.core-security =
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
        ruleFile = config.age.secrets.usbguard-rules.path;
        IPCAllowedGroups = [ "wheel" ];
        presentDevicePolicy = "apply-policy";
        presentControllerPolicy = "apply-policy";
        insertedDevicePolicy = "apply-policy";
        implicitPolicyTarget = "block";
      };
    };
}
