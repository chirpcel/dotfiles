{ config, ... }:
{
  users.users."mkrstn" = {
    isNormalUser = true;
    description = "Marcel Kersten";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPassword = "$y$j9T$Z7laQaHw.bhKgsl22uvZe1$FZqppGT9tfKAldv759pi0FQ.EP5bvzsgy5GWc1dEUe.";
    useDefaultShell = true;
  };
}
