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
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
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
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
    in
    {
      nixosConfigurations.horus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system configVars;
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

      homeConfigurations.${configVars.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs system configVars;
        };
        modules = [ ./home/base.nix ];
      };
    };
}
