{ pkgs, lib, ... }:
{
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

  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    gnome.gnome-keyring
    gnome.seahorse
  ];
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.wayland.enableGnomeKeyring = true;

  #services.clamav = {
  #  daemon.enable = true;
  #  updater.enable = true;
  #  updater.interval = "daily";
  #  updater.frequency = 12;
  #};
}
