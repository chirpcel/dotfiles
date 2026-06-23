{ lib, ... }:

{
  age.secrets.sb-guid.rekeyFile = ../../../assets/secrets/sb-guid.age;
  age.secrets.sb-db-key.rekeyFile = ../../../assets/secrets/sb-db.key.age;
  age.secrets.sb-db-pem.rekeyFile = ../../../assets/secrets/sb-db.pem.age;
  age.secrets.sb-kek-key.rekeyFile = ../../../assets/secrets/sb-kek.key.age;
  age.secrets.sb-kek-pem.rekeyFile = ../../../assets/secrets/sb-kek.pem.age;
  age.secrets.sb-pk-key.rekeyFile = ../../../assets/secrets/sb-pk.key.age;
  age.secrets.sb-pk-pem.rekeyFile = ../../../assets/secrets/sb-pk.pem.age;

  age.secrets = {
    sb-guid.path = "/var/lib/sbctl/GUID";
    sb-db-key.path = "/var/lib/sbctl/keys/db/db.key";
    sb-db-pem.path = "/var/lib/sbctl/keys/db/db.pem";
    sb-kek-key.path = "/var/lib/sbctl/keys/KEK/KEK.key";
    sb-kek-pem.path = "/var/lib/sbctl/keys/KEK/KEK.pem";
    sb-pk-key.path = "/var/lib/sbctl/keys/PK/PK.key";
    sb-pk-pem.path = "/var/lib/sbctl/keys/PK/PK.pem";
  };

  #boot.loader.systemd-boot.enable = lib.mkForce false;
  #boot.lanzaboote = {
  #  enable = true;
  #  pkiBundle = "/var/lib/sbctl";
  #};
}
