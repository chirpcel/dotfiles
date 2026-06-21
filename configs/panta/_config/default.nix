{
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    ./persistence.nix
  ];

  system.stateVersion = "26.05";
  networking.hostName = "panta";

  stow.location = "/home/mkrstn/documents/repositories/dotfiles/stow";

  hardware.cpu.intel.npu.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  environment.etc."issue".text = ''
    ██████╗  █████╗ ███╗   ██╗████████╗ █████╗
    ██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██╔══██╗
    ██████╔╝███████║██╔██╗ ██║   ██║   ███████║
    ██╔═══╝ ██╔══██║██║╚██╗██║   ██║   ██╔══██║
    ██║     ██║  ██║██║ ╚████║   ██║   ██║  ██║
    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝
  '';

  users.users."mkrstn" = {
    isNormalUser = true;
    description = "Marcel Kersten";
    extraGroups = [
      "networkmanager"
      "wheel"
      "seat"
    ];
    hashedPasswordFile = config.age.secrets.mkrstn-passwd.path;
  };

  age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIClwAeCI0RDjkSKo8b+8umKHXzFPWNbwdGJEtSeuqNt/";
  age.identityPaths = [ "/persistent/etc/ssh/ssh_host_key" ];
  age.secrets.mkrstn-passwd.rekeyFile = ../../../assets/secrets/mkrstn-passwd.age;
  age.secrets.mistral-api-key.rekeyFile = ../../../assets/secrets/mistral-api-key.age;
  age.secrets.nix-access-tokens.rekeyFile = ../../../assets/secrets/nix-access-tokens.age;
  age.secrets = {
    mistral-api-key = {
      path = "/home/mkrstn/.vibe/.env";
      mode = "700";
      owner = "mkrstn";
      group = "users";
    };
  };
  systemd.tmpfiles.rules = [
    "d /home/mkrstn/.vibe 0700 mkrstn users -"
  ];
}
