{
  flake.nixosModules.geforce-now = {
    services.flatpak = {
      remotes = [
        {
          name = "geforce-now";
          location = "https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo";
        }
      ];
      packages = [
        {
          appId = "com.nvidia.geforcenow";
          origin = "geforce-now";
        }
      ];
    };
  };
}
