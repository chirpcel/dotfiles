{ inputs, ... }:

{
  imports = [
    inputs.disko.flakeModules.default
  ];
  flake.diskoConfigurations = {
    default = {
      disko.devices = {
        disk = {
          main = {
            type = "disk";
            device = "/dev/nvme0n1";
            content = {
              type = "gpt";
              partitions = {
                esp = {
                  size = "4G";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                storage = {
                  size = "100%";
                  content = {
                    type = "btrfs";
                    extraArgs = [
                      "-f"
                      "-L storage"
                      "--checksum xxhash"
                    ];
                    subvolumes = {
                      "/@root" = {
                        mountpoint = "/";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/@nix" = {
                        mountpoint = "/nix";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/@persistent" = {
                        mountpoint = "/persistent";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/@home" = {
                        mountpoint = "/home";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/@snapshots" = {
                        mountpoint = "/.snapshots";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/@cache" = {
                        mountpoint = "/home/mkersten/.cache";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
    impermanence = {
      disko.devices = {
        disk = {
          main = {
            type = "disk";
            device = "/dev/nvme0n1";
            content = {
              type = "gpt";
              partitions = {
                esp = {
                  size = "4G";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                storage = {
                  size = "100%";
                  content = {
                    type = "luks";
                    name = "storage";
                    settings = {
                      allowDiscards = true;
                    };
                    extraFormatArgs = [
                      "--hw-opal-only"
                    ];
                    content = {
                      type = "btrfs";
                      extraArgs = [
                        "-f"
                        "-L storage"
                        "--checksum xxhash"
                      ];
                      subvolumes = {
                        "/@nix" = {
                          mountpoint = "/nix";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                        "/@persistent" = {
                          mountpoint = "/persistent";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                        "/@home" = {
                          mountpoint = "/home";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                        "/@snapshots" = {
                          mountpoint = "/.snapshots";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                        "/@cache" = {
                          mountpoint = "/home/mkersten/.cache";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        };
        nodev = {
          "/" = {
            fsType = "tmpfs";
            mountOptions = [
              "defaults"
              "size=4G"
              "mode=755"
            ];
          };
        };
      };
    };
  };
}
