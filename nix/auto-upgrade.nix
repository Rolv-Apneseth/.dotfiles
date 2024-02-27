{...}: {
  system.autoUpgrade = {
    enable = true;
    operation = "switch";
    flake = "/etc/nixos";
    flags = ["--update-input" "nixpkgs" "--update-input" "rust-overlay" "--commit-lock-file"];
    dates = "weekly";
  };
}
