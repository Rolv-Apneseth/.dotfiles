{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # LD fix
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
  # NH
  programs.nh = {
    enable = true;
    clean.enable = false;
    flake = "/home/rolv/.dotfiles/nix/";
  };

  services.mpd.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true; # enable saving preferences
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin # archive management
    thunar-volman # automatic volume management
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
    alejandra
    bat
    curl
    dunst
    libnotify
    eza
    firefox
    libgcc
    gcc
    git
    gnumake
    hyprpicker
    kitty
    macchina
    nodejs
    psi-notify
    ripgrep
    rofi-wayland
    rustup
    starship
    stow
    thunderbird
    unzip
    vim
    wezterm
    wget
    wl-clipboard
    wtype
    xdg-utils
    yarn
    yazi
    zoxide
    zsh
    nixfmt-rfc-style
    typos
    stylua
    shellharden
    beautysh
    wpaperd
    python3
    lazygit
    fzf
    haskellPackages.greenclip
    age
    ssh-to-age
    sops
    nwg-look
  ];
}
