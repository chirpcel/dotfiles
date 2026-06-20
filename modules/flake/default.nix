{ lib, ... }:
{
  options = {
    path = lib.mkOption {
      type = with lib.types; str;
    };
  };
}
