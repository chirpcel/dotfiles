{ pkgs, ... }:

{
  boot.initrd = {
    systemd = {
      enable = true;
      extraBin = {
        btrfs = "${pkgs.btrfs-progs}/bin/btrfs";
        mkdir = "${pkgs.coreutils}/bin/mkdir";
      };
      services.rollback = {
        description = "@home snapshot/reset before mounting root";
        wantedBy = [ "initrd.target" ];
        after = [ "systemd-cryptsetup@storage.service" ];
        before = [ "sysroot.mount" ];
        unitConfig.DefaultDependencies = "no";
        serviceConfig = {
          Type = "oneshot";
        };
        script = builtins.readFile ./src/reset-home.sh;
      };
    };
  };
}
