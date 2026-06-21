{ ... }:

{
  environment.persistence."/persistent" = {
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_key"
      "/etc/ssh/ssh_host_key.pub"
    ];
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/upower"
      "/var/lib/iwd"
      "/var/lib/flatpak"
    ];
    users.mkrstn = {
      directories = [
        ".var/app"
        ".config/dconf"
        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".local/share/keyrings"
        ".gnupg"
        ".ssh"
        "desktop"
        "documents"
        "downloads"
        "music"
        "pictures"
        "public"
        "templates"
        "videos"
      ];
    };
  };
}
