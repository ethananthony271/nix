{
  description = "Baby's first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    # hyprpanel,
    ...
    }: let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      leoito = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      ea = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          # overlays = [
          #   inputs.hyprpanel.overlay
          # ];
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
        # pkgs.overlays = [ inputs.hyprpanel.overlay ];
      };
    };
  };
}
