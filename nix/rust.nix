{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  environment.systemPackages = with pkgs; [
    (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
    lldb_16
    taplo # toml formatter & lsp
    cargo-watch
    cargo-spellcheck
    cargo-bloat
  ];
}
