{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  time.timeZone = "Europe/Dublin";
  i18n.defaultLocale = "en_IE.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nix = {
    # Add each flake input as a registry to make nix commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Add inputs to the system's legacy channels making legacy nix commands consistent as well
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # See https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB

      # De-duplicate and optimize nix store (on every build)
      auto-optimise-store = true;

      # Extra features
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # No need for warning
      warn-dirty = false;
    };

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
