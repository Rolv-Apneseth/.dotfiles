{pkgs, ...}: {
  # Fonts
  fonts.packages = with pkgs; [
    roboto
    roboto-mono
    nerd-font-patcher

    (nerdfonts.override {fonts = ["RobotoMono" "Inconsolata" "InconsolataGo" "InconsolataLGC"];})
  ];
}
