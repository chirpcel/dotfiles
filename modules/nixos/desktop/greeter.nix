{
  flake.nixosModules.greeter =
    { pkgs, ... }:
    {
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --window-padding 1 --user-menu --asterisks --issue";
            user = "greeter";
          };
        };
      };
    };
}
