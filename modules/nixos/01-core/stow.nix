{
  flake.nixosModules.core-stow =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.stow;
    in
    {
      options.stow = {
        enable = lib.mkEnableOption "stow";
        location = lib.mkOption {
          type = lib.types.str;
          default = "/etc/nixos/stow";
        };
        packages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
      };
      config =
        let
          stowScript = pkgs.writeShellScript "apply-dotfiles.sh" (
            builtins.readFile ../../../assets/scripts/apply-dotfiles.sh
          );
          normalUsers = lib.filterAttrs (name: user: user.isNormalUser) config.users.users;
        in
        lib.mkIf (builtins.length cfg.packages > 0 && cfg.enable) {
          systemd.services = lib.mkMerge (
            lib.mapAttrsToList (username: _: {
              "stow-${username}" = {
                description = "Stow activiation for ${username}";
                wantedBy = [ "multi-user.target" ];
                path = with pkgs; [ stow ];
                serviceConfig = {
                  Type = "simple";
                  User = username;
                  ExecStart = "${stowScript} ${username} ${cfg.location}/${username} /home/${username} ${lib.concatStringsSep " " cfg.packages}";
                };
              };
            }) normalUsers
          );
        };
    };
}
