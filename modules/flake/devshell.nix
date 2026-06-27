{ inputs, ... }:

{
  imports = [
    inputs.devshell.flakeModule
  ];
  perSystem = { config, pkgs, ... }: {
    devshells.default = {
      commands = [
        {
          name = "nboot";
          command = "nh os boot .?submodules=1";
        }
        {
          name = "nswitch";
          command = "nh os switch .?submodules=1";
        }
        {
          name = "nrekey";
          command = "agenix --extra-flake-params '?submodules=1' rekey";
        }
      ];
      packages = [
        pkgs.disko
        config.agenix-rekey.package
        pkgs.rage
        pkgs.age-plugin-yubikey
        pkgs.nh
      ];
    };
  };
}
