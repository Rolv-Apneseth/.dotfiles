{ pkgs, configVars, ... }:
{
  users.users.${configVars.username} = {
    isNormalUser = true;
    description = "main user";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
