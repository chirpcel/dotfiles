{
  flake.nixosModules.core-shell =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        useBabelfish = true;
        interactiveShellInit = ''
          export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
        '';
      };
      environment.systemPackages = with pkgs; [
        fishPlugins.hydro
      ];
      users.defaultUserShell = pkgs.fish;
      stow.packages = [
        "fish"
      ];
    };
}
