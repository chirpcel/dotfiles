{ pkgs, ... }:

{
  services.acpid = {
    enable = true;
    lidEventCommands = ''
      case "$1" in
        *close)
          echo "$(date): lid closed, blocking fingerprint" >> /tmp/lid-events.log
          ${pkgs.usbguard}/bin/usbguard block-device 27c6:658c
          ;;
        *open)
          echo "$(date): lid opened, allowing fingerprint" >> /tmp/lid-events.log
          ${pkgs.usbguard}/bin/usbguard allow-device 27c6:658c

          # Give kernel time to re-enumerate
          ${pkgs.coreutils}/bin/sleep 0.5

          # Push kernel udev to propagate the change
          ${pkgs.udev}/bin/udevadm trigger --action=add --subsystem-match=usb
          ${pkgs.udev}/bin/udevadm settle

          # Force fprintd to rediscover devices via its D-Bus API
          ${pkgs.dbus}/bin/dbus-send --system --dest=org.freedesktop.fprintd \
            --type=method_call \
            /org/freedesktop/fprintd/Manager \
            org.freedesktop.fprintd.Manager.GetDevice 2>/dev/null || true

          # Fallback: gentle daemon reload if D-Bus ping didn't help
          systemctl --user restart fprintd 2>/dev/null || systemctl restart fprintd
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
      ${coreutils}/bin/sleep 5
      if ! ${procps}/bin/pgrep -x "usbguard-daemon" > /dev/null; then
        ${coreutils}/bin/sleep 5
      fi
      LID_STATE=$(${coreutils}/bin/cat /proc/acpi/button/lid/LID/state | ${gawk}/bin/awk '{print $2}')
      if [ "$LID_STATE" = "closed" ]; then
        ${usbguard}/bin/usbguard block-device 27c6:658c
      else
        ${usbguard}/bin/usbguard allow-device 27c6:658c
      fi
    '';
  };
}
