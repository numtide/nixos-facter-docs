{
  description = "nixos-facter-docs";
  # To update all inputs:
  # $ nix flake update --recreate-lock-file

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    #mkdocs-numtide.url = "github:numtide/mkdocs-numtide";
    #mkdocs-numtide.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = with pkgs; [
            mkdocs
            python3Packages.mkdocs-material
        ];
      in
        {
          devShells.default = pkgs.mkShellNoCC {
            inherit packages;
          };

          packages.default = pkgs.stdenv.mkDerivation {
            src = ./.;
            name = "nixos-facter-docs";
            nativeBuildInputs = packages;
            buildPhase = "mkdocs build -d $out";
          };
        }
    );
}