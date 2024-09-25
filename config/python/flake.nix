{
  description = "My Python Flake Shells";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in {
      devShells.${system}.python39 = pkgs.mkShell {
        nativeBuildInputs = with pkgs;
          let
            devpython = pkgs.python38.withPackages
              (packages: with packages; [ virtualenv pip setuptools wheel ]);
          in [ devpython ];
      };
    };
}
