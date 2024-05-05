{ pkgs, ... }:
{
  #systemd.packages = with pkgs; [
  #  auto-cpufreq
  #];
  #services.auto-cpufreq.enable = true;

  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
    xfce.xfconf
    gnome2.GConf
  ];
  services.fwupd.enable = true;
}
