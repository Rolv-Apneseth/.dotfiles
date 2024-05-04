{
  pkgs,
  lib,
  ...
}: {
  #users.users.root.hashedPassword = "!";
  #security.tpm2 = {
  #  enable = true;
  #  pkcs11.enable = true;
  #  tctiEnvironment.enable = true;
  #};
  #security.apparmor = {
  #  enable = true;
  #  packages = with pkgs; [
  #    apparmor-utils
  #    apparmor-profiles
  #  ];
  #};
  # services.fail2ban.enable = true;
  #security.polkit.enable = true;
  #environment.systemPackages = with pkgs; [
  #  libsForQt5.polkit-kde-agent
  #];

  #services.clamav = {
  #  daemon.enable = true;
  #  updater.enable = true;
  #  updater.interval = "daily";
  #  updater.frequency = 12;
  #};
}
