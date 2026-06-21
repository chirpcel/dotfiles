{
  flake.nixosModules.gtk =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = with pkgs; [
          adw-gtk3
        ];
      };
    };
}
