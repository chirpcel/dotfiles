{
  flake.nixosModules.development-agent =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        (pkgs.symlinkJoin {
          name = "${lib.getName nono}-wrapped-${lib.getVersion nono}";
          paths = [ nono ];
          preferLocalBuild = true;
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/${nono.meta.mainProgram or "nono"} \
              --suffix PATH : ${
                lib.makeBinPath [
                  pi-coding-agent
                ]
              }
          '';
        })
      ];
      environment.variables.PI_OFFLINE = 1;
      stow.packages = [
        "nono"
        "pi"
      ];
    };
}
