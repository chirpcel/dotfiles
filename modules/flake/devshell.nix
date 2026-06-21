{ inputs, ... }:

{
  imports = [
    inputs.devshell.flakeModule
  ];
  perSystem = { config, pkgs, ... }: {
    devshells.default = {
      commands = [
        {
          name = "boot";
          command = "nh os boot .?submodules=1";
        }
        {
          name = "switch";
          command = "nh os switch .?submodules=1";
        }
        {
          name = "rekey";
          command = "agenix --extra-flake-params '?submodules=1' rekey";
        }
      ];
      packages = [
        pkgs.disko
        config.agenix-rekey.package
        pkgs.rage
        pkgs.age-plugin-yubikey
      ];
    };
  };
}
