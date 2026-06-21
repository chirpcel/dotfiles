{ inputs, ... }:

{
  flake.nixosModules.ankylo =
    { pkgs, config, ... }:
    {
      imports = [
        inputs.ankylo.nixosModules.ankylo
      ];
      programs.ankylo.enable = true;
      programs.ankylo.lock.package =
        inputs.ankylo.packages.${pkgs.stdenv.hostPlatform.system}.ankylo-lock;
      programs.ankylo.pinentry.package =
        inputs.ankylo.packages.${pkgs.stdenv.hostPlatform.system}.ankylo-pinentry;
      security.pam.services = {
        ankylo-lock.u2fAuth = true;
        ankylo-lock.fprintAuth = true;
      };
      security.pam.services.sudo.rules.auth.fprintd.order =
        config.security.pam.services.sudo.rules.auth.u2f.order - 10;
      security.pam.services.ankylo-lock.rules.auth.fprintd.order =
        config.security.pam.services.ankylo-lock.rules.auth.u2f.order - 10;
    };
}
