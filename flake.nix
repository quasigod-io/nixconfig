{
  description = "Quasigod's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    devenv.url = "github:cachix/devenv";
    helix.url = "github:helix-editor/helix";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

  };
  outputs = inputs @ { nixpkgs, nix-gaming, home-manager, hyprland, darwin, devenv, helix, ... }:
    let
      user = "quasi";
      flakePath = "/home/${user}/.flake"; # Used for commands and aliases

      localOverlays = import ./packages/overlays.nix hyprland;
      inputOverlays = [
        (_: super: {
          inherit (hyprland.packages.${super.system}) hyprland;
          inherit (helix.packages.${super.system}) helix; 
          inherit (devenv.packages.${super.system}) devenv;
          inherit (nix-gaming.packages.${super.system}) wine-tkg;
        })
      ];
      pkgsForSystem = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = inputOverlays ++ [ localOverlays ];
      };
    in
    {
      nixosConfigurations =
        import ./nixos {
          inherit (nixpkgs) lib;
          inherit pkgsForSystem user flakePath inputs home-manager;
        };

      darwinConfigurations =
        import ./osx {
          inherit (nixpkgs) lib;
          inherit pkgsForSystem user inputs home-manager darwin devenv;
      };

      devShells."x86_64-linux".rust = import ./shells/rust.nix { inherit pkgsForSystem; };
    };
}
