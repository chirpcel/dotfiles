{ inputs, ... }:

{
  flake.nixosModules.core-agenix =
    { config, ... }:
    {
      imports = [
        inputs.ragenix.nixosModules.default
        inputs.agenix-rekey.nixosModules.default
      ];
      age.rekey = {
        masterIdentities = [ ../../../assets/age/identity.pub ];
        storageMode = "local";
        localStorageDir = ../../../assets/secrets/rekeyed/${config.networking.hostName};
      };
    };
}
