{
  config,
  pkgs,
  configVars,
  ...
}:
{
  home.username = configVars.username;
  home.homeDirectory = /home/${configVars.username};
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = [

  ];

  programs.git = {
    enable = true;
    userName = configVars.git_username;
    userEmail = configVars.git_email;
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
          "~/.ssh/id_main"
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
        "file:///home/${configVars.username}/.config Config"
        "file:///home/${configVars.username}/.dotfiles Dots"
        "file:///home/${configVars.username}/Downloads"
        "file:///home/${configVars.username}/Music"
        "file:///home/${configVars.username}/Pictures"
        "file:///home/${configVars.username}/repos Repos"
        "file:///home/${configVars.username}/Videos"
        "file:///home/${configVars.username}/work Work"
      ];
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
}
