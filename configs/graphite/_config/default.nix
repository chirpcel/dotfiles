{
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    ./persistence.nix
    ./secure-boot.nix
  ];

  system.stateVersion = "26.05";
  networking.hostName = "graphite";

  stow.enable = true;
  stow.location = "/home/mkrstn/documents/repositories/dotfiles/stow";

  hardware.cpu.intel.npu.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  environment.etc."issue".text = ''
     ██████╗ ██████╗  █████╗ ██████╗ ██╗  ██╗██╗████████╗███████╗
    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██║  ██║██║╚══██╔══╝██╔════╝
    ██║  ███╗██████╔╝███████║██████╔╝███████║██║   ██║   █████╗
    ██║   ██║██╔══██╗██╔══██║██╔═══╝ ██╔══██║██║   ██║   ██╔══╝
    ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║██║   ██║   ███████╗
     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝
  '';

  users.users."mkrstn" = {
    isNormalUser = true;
    description = "Marcel Kersten";
    extraGroups = [
      "networkmanager"
      "wheel"
      "seat"
    ];
    hashedPassword = "$y$j9T$Z7laQaHw.bhKgsl22uvZe1$FZqppGT9tfKAldv759pi0FQ.EP5bvzsgy5GWc1dEUe.";
    useDefaultShell = true;
    linger = true;
  };

  age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIClwAeCI0RDjkSKo8b+8umKHXzFPWNbwdGJEtSeuqNt/";
  age.identityPaths = [ "/persistent/etc/ssh/ssh_host_key" ];
  age.secrets.mistral-api-key.rekeyFile = ../../../assets/secrets/mistral-api-key.age;
  age.secrets.nix-access-tokens.rekeyFile = ../../../assets/secrets/nix-access-tokens.age;
  age.secrets.usbguard-rules.rekeyFile = ../../../assets/secrets/graphite-usbguard-rules.age;
  age.secrets.u2f-authfile.rekeyFile = ../../../assets/secrets/u2f-authfile.age;
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

  services.usbguard.ruleFile = config.age.secrets.usbguard-rules.path;
}
