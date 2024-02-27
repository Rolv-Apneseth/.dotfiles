{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "nixos-rolv";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # XDG
  xdg = {
    portal = {
      enable = true;
      # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  # SSH
  # services.openssh.enable = true;

  # USB auto mounting
  services.gvfs.enable = true;
}
