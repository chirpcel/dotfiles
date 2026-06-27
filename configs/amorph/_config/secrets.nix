{
  age.identityPaths = [ "/etc/ssh/ssh_host_key" ];
  age.secrets.nix-access-tokens.rekeyFile = ../../../assets/secrets/nix-access-tokens.age;
}