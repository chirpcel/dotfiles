{
  flake.nixosModules.core-editor =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;
      };
      environment.systemPackages = [
        (lib.hiPrio (
          pkgs.runCommand "nvim.desktop-hide" { } ''
            mkdir -p "$out/share/applications"
            cat "${config.programs.neovim.finalPackage}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
            echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
          ''
        ))
      ];
    };
}
