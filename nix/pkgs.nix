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
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rolv/.dotfiles/nix/";
  };

  services.mpd.enable = true;

  programs.thunar.enable = true;
  services.tumbler.enable = true;

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
    eza
    firefox
    libgcc
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
    #(waybar.overrideAttrs (oldAtrrs: {
    #	mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #})
    #)
  ];
}
