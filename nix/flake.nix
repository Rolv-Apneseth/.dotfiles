{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    hyprland.url = "github:hyprwm/Hyprland";
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "git+ssh://git@gitlab.com/Rolv-Apneseth/secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.horus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;
        };
        modules = [
          ./hosts/horus
          #./auto-upgrade.nix
          ./bootloader.nix
          ./base.nix
          ./sops.nix
          ./display-manager.nix
          ./networking.nix
          ./env-variables.nix
          ./fonts.nix
          ./gnome.nix
          ./hyprland.nix
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

      homeConfigurations.rolv = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs system;
        };
        modules = [ ./home/base.nix ];
      };
    };
}
