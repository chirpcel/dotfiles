{
  flake.nixosModules.development-agent =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        (pkgs.writeScriptBin "pi" ''
          exec ${pkgs.nono}/bin/nono run --profile always-further/pi --allow-cwd -- ${pkgs.pi-coding-agent}/bin/pi "$@"
        '')
      ];
      environment.variables.PI_OFFLINE = 1;
      stow.packages = [
        "pi"
      ];
    };
}
