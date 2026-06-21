{ inputs, ... }:

{
  flake.nixosModules.ankylo =
    { pkgs, ... }:
    {
      imports = [
        inputs.ankylo.nixosModules.ankylo
      ];
      programs.ankylo.enable = true;
      programs.ankylo.lock.package = inputs.ankylo.packages.${pkgs.system}.ankylo-lock;
      programs.ankylo.pinentry.package = inputs.ankylo.packages.${pkgs.system}.ankylo-pinentry;
      programs.ankylo.polkit.package = inputs.ankylo.packages.${pkgs.system}.ankylo-polkit;
    };
}
