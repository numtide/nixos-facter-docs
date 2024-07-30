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
        name = "nixos-facter-docs";
        src = ./.;
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
          packages.default = pkgs.stdenv.mkDerivation {
            inherit name src;
            nativeBuildInputs = with pkgs;[
              mkdocs
              python3Packages.mkdocs-material
            ];
            buildPhase = "mkdocs build -d $out";
          };
        }
    );
}