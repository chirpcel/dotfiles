{
  flake.nixosModules.core-file-sharing =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        magic-wormhole-rs
      ];
    };
}
