{
  flake.nixosModules.udev-fractal-design-scape = {
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36bc", ATTRS{idProduct}=="0001", MODE="0660", GROUP="users", TAG+="uaccess"
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36bc", ATTRS{idProduct}=="2001", MODE="0660", GROUP="users", TAG+="uaccess"
    '';
  };
}
