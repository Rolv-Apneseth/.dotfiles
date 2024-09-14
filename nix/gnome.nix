{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable Gnome
  #services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # # Exclude packages
  # environment.gnome.excludePackages =
  #   (with pkgs; [
  #     gnome-tour
  #   ])
  #   ++ (with pkgs.gnome; [
  #     epiphany
  #     geary
  #     tali
  #     iagno
  #     hitori
  #     atomix
  #   ]);
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}
