{
  age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIClwAeCI0RDjkSKo8b+8umKHXzFPWNbwdGJEtSeuqNt/";
  age.identityPaths = [ "/persistent/etc/ssh/ssh_host_key" ];
  age.secrets.nix-access-tokens.rekeyFile = ../../../assets/secrets/nix-access-tokens.age;
}
