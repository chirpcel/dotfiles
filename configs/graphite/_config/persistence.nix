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
      "/var/lib/fprint"
    ];
    users.mkrstn = {
      directories = [
        ".var/app"
        ".config/dconf"
        ".local/share/keyrings"
        ".local/share/fish"
        ".local/share/direnv"
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
