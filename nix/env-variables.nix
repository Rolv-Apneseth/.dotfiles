{pkgs, ...}: {
  environment.variables = {
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    TERMINAL_EXECUTE = "$TERMINAL -e";
    TERMINAL_DIR = "$TERMINAL start --cwd";
  };

  environment.sessionVariables = {

    # Stowed dotfiles directory
    DOTFILES = "/home/rolv/.dotfiles";

    # ZSH config file
    ZDOTDIR = "/home/rolv/.config/zsh";

    # zk notebooks
    ZK_NOTEBOOK_DIR = "/home/rolv/Documents/zk";
  };
}
