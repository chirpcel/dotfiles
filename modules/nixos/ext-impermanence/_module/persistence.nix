{
  fileSystems."/persistent".neededForBoot = true;
  fileSystems."/home".neededForBoot = true;
  environment.persistence."/persistent" = {
    enable = true;
    hideMounts = true;
    allowTrash = true;
  };
}
