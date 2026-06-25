{
  flake.nixosModules.development-agent =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        mistral-vibe
      ];
      stow.packages = [ "vibe" ];
    };
}
