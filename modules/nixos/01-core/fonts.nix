{
  flake.nixosModules.core-fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          nerd-fonts.symbols-only
        ];
      };
    };
}
