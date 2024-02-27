{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.mpd.enable = true;

  programs.thunar.enable = true;
  services.tumbler.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    curl
    dunst
    eza
    firefox
    gcc
    git
    gnumake
    hyprpicker
    kitty
    libnotify
    macchina
    nodejs
    psi-notify
    ripgrep
    rofi-wayland
    rustup
    starship
    stow
    swww
    swww
    thunderbird
    unzip
    vim
    waybar
    wezterm
    wget
    wl-clipboard
    wtype
    xdg-utils
    yarn
    yazi
    zoxide
    zsh
    #(waybar.overrideAttrs (oldAtrrs: {
    #	mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #})
    #)
  ];
}
