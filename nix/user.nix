{pkgs, ...}: {
  users.users.rolv = {
    isNormalUser = true;
    description = "rolv";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
