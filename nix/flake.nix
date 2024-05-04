{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos-rolv = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ./host-laptop.nix
        #./auto-upgrade.nix
        ./bootloader.nix
        ./configuration.nix
        ./display-manager.nix
        #./dns.nix
        ./env-variables.nix
        ./firewall.nix
        ./fonts.nix
        #./gc.nix
        ./gnome.nix
        ./hyprland.nix
        ./linux-kernel.nix
        ./pkgs.nix
        ./rust.nix
        ./security-services.nix
        ./services.nix
        ./sound.nix
        ./theme.nix
        ./user.nix
        #./virtualisation.nix
      ];
    };
  };
}
