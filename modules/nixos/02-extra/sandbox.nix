{
  flake.nixosModules.extra-sandbox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nono
      ];
      stow.packages = [
        "nono"
      ];
    };
}
