{
  flake.nixosModules.editor =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        helix
      ];
      environment.variables.EDITOR = "hx";
    };
}
