{ config, pkgs, ... }:
{
  home.username = "rolv";
  home.homeDirectory = "/home/rolv";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = [

  ];

  programs.git = {
    enable = true;
    userName = "Rolv-Apneseth";
    userEmail = "rolv.apneseth@gmail.com";
    aliases = {
      s = "status";
    };
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };

  programs.firefox = {
    enable = true;
    # profiles.rolv = {
    # }
  };

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "yubikey-hosts" = {
        host = "gitlab.com github.com";
        identitiesOnly = true;
        identityFile = [
          # "~/.ssh/id_yubikey"
          "~/.ssh/id_manu"
        ];
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.juno-theme;
      name = "Juno";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
    };
    iconTheme = {
      package = pkgs.vimix-icon-theme;
      name = "Vimix-Amethyst";
    };

    gtk3 = {
      bookmarks = [
        "file:///home/rolv/.config Config"
        "file:///home/rolv/.dotfiles Dots"
        "file:///home/rolv/Downloads"
        "file:///home/rolv/Music"
        "file:///home/rolv/Pictures"
        "file:///home/rolv/repos Repos"
        "file:///home/rolv/Videos"
        "file:///home/rolv/work Work"
      ];
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
}
