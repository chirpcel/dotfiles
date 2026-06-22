{
  flake.nixosModules.agent =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        mistral-vibe
      ];
      stow.packages = [ "vibe" ];
    };
}
