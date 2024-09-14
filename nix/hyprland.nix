{
  inputs,
  pkgs,
  system,
  ...
}:
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  programs.dconf.enable = true;
  hardware.opengl.enable = true;

  programs.waybar.enable = true;
  programs.waybar.package = inputs.nixpkgs-wayland.packages.${system}.waybar;

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
