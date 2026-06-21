{ pkgs, ... }:
{
  services.acpid = {
    enable = true;
    lidEventCommands = ''
      case "$1" in
        *close)
          echo "lid closed, block finerprint"
          ${pkgs.usbguard}/bin/usbguard block-device 27c6:658c
          ;;
        *open)
          echo "lid opened, allow finerprint"
          ${pkgs.usbguard}/bin/usbguard allow-device 27c6:658c
          ;;
      esac
    '';
  };
  systemd.services.check-lid-status = {
    description = "Check lid status at boot and block/unblock fingerprint sensor";
    wantedBy = [ "multi-user.target" ];
    after = [ "usbguard.service" ];
    unitConfig = {
      Type = "oneshot";
    };
    script = with pkgs; ''
      # Warte 5 Sekunden, um sicherzustellen, dass USBGuard bereit ist
      ${coreutils}/bin/sleep 5

      # Prüfe, ob USBGuard läuft
      if ! ${coreutils}/bin/pgrep -x "usbguard-daemon" > /dev/null; then
        echo "USBGuard ist nicht bereit. Warte weitere 5 Sekunden..."
        ${coreutils}/bin/sleep 5
      fi

      # Prüfe den Lid-Status
      LID_STATE=$(${coreutils}/bin/cat /proc/acpi/button/lid/LID/state | ${gawk}/bin/awk '{print $2}')

      # Blockiere/erlaube den Sensor basierend auf dem Lid-Status
      if [ "$LID_STATE" = "closed" ]; then
        ${usbguard}/bin/usbguard block-device 27c6:658c
      else
        ${usbguard}/bin/usbguard allow-device 27c6:658c
      fi
    '';
  };
}
