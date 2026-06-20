{
  flake.nixosModules.terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        alacritty
      ];
    };
}
