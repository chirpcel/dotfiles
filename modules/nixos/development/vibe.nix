{
  flake.nixosModules.vibe =
    { lib, pkgs, ... }:
    {
      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "textual-speedups"
        ];
      environment.systemPackages = with pkgs; [
        mistral-vibe
      ];
      stow.packages = [ "vibe" ];
    };
}
