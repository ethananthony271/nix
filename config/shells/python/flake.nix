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
      devShells.${system}.python312 = pkgs.mkShell {
        nativeBuildInputs = with pkgs;
          let
            devpython = pkgs.python312.withPackages(
              packages: with packages; [
                z3-solver
                numpy
                wheel
              ]);
          in[
            devpython
          ];
      };
    };
}
