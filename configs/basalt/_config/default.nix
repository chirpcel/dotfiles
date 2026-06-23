{
  environment.etc."issue".text = ''
    ██████╗  █████╗ ███████╗ █████╗ ██╗  ████████╗
    ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║  ╚══██╔══╝
    ██████╔╝███████║███████╗███████║██║     ██║
    ██╔══██╗██╔══██║╚════██║██╔══██║██║     ██║
    ██████╔╝██║  ██║███████║██║  ██║███████╗██║
    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝
  '';
  networking.hostName = "basalt";
  system.stateVersion = "26.05";
  stow.location = "/home/mkrstn/projects/dotfiles/stow";
  imports = [
    ./secrets.nix
    ./user.nix
  ];
}
