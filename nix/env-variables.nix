{ pkgs, ... }:
{
  environment.localBinInPath = true;
  environment.pathsToLink = [ "/home/rolv/.config/rofi/scripts/" ];

  environment.variables = {
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    TERMINAL_EXECUTE = "$TERMINAL -e";
    TERMINAL_DIR = "$TERMINAL start --cwd";

    MY_EMAIL_CLIENT = "thunderbird";
    MY_EXPLORER = "thunar";
    MY_SCREENSHOT = "flameshot gui";
    MY_SYSTEM_MONITOR = "psensor";
    MY_VOLUME_MANAGER = "pavucontrol";
    MY_WORK_COMMUNICATION = "google-chat-linux";
    MY_MEDIA_PLAYER = "celluloid";
    MY_FONTS_EXPLORER = "font-manager";

    MY_LAUNCHER = "rofi-wrapper run";
    MY_GAMES_LAUNCHER = "rofi-wrapper games";
    MY_CLIPBOARD = "rofi-wrapper clipboard";
    MY_CALCULATOR = "rofi-wrapper calc";
    MY_SELECTOR_DEFAULT_SOUND_SINK = "rofi-wrapper sound_sink";
    MY_SELECTOR_EDIT_FILE = "rofi-wrapper edit";
    MY_SELECTOR_EMOJIS = "rofi-wrapper emojis";
    MY_SELECTOR_ICONS = "rofi-wrapper nerdy";

    # Stowed dotfiles directory
    DOTFILES = "/home/rolv/.dotfiles";

    # ZSH config file
    ZDOTDIR = "/home/rolv/.config/zsh";

    # zk notebooks
    ZK_NOTEBOOK_DIR = "/home/rolv/Documents/zk";
  };
}
