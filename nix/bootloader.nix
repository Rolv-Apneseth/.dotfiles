{pkgs, ...}: {
  boot.initrd.enable = true;
  boot.initrd.systemd.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 10;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  boot.plymouth = {
    enable = true;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [pkgs.catppuccin-plymouth];
    theme = "catppuccin-macchiato";
  };
}
