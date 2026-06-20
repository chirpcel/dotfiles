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
    hashedPassword = "$y$j9T$Z7laQaHw.bhKgsl22uvZe1$FZqppGT9tfKAldv759pi0FQ.EP5bvzsgy5GWc1dEUe.";
  };
}
