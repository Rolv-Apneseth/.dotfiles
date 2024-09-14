{ pkgs, ... }:
let
  grubTheme = pkgs.fetchFromGitHub {
    owner = "shvchk";
    repo = "fallout-grub-theme";
    rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
    sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
  };
in
{
  boot.initrd.enable = true;
  boot.initrd.systemd.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.theme = grubTheme;

  boot.plymouth = {
    enable = true;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";
  };

  boot.kernelParams = [
    "quiet"
    "splash"
    "nosgx"
    #"fbcon=nodefer"
    #"vt.global_cursor_default=0"
    #"kernel.modules_disabled=1"
    #"lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
    #"usbcore.autosuspend=-1"
    #"video4linux"
    #"acpi_rev_override=5"
    # "security=selinux"
  ];

  # systemd.package = pkgs.systemd.override {withSelinux = true;};
}
