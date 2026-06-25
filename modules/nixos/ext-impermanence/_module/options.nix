{ lib, ... }:

with lib;

{
  options.dotfiles.nixos.persistence = {
    directories = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "List of directories to persist.";
    };
    files = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "List of files to persist.";
    };
  };
}
