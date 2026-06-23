{ config, ... }:
{
  users.users."mkrstn" = {
    isNormalUser = true;
    description = "Marcel Kersten";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPasswordFile = config.age.secrets.mkrstn-passwd.path;
    useDefaultShell = true;
  };
}
