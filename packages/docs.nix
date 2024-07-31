{ pkgs, pname, ... }:
let
  inherit (pkgs) lib;
  fs = lib.fileset;
in
pkgs.stdenv.mkDerivation {
  # pname comes from the name of this file and is passed in by blueprint
  inherit pname;
  version = "0.0.1";

  # define the source set, only including necessary files so we avoid unnecessary nix rebuilds
  src = fs.toSource {
    root = ../.;
    fileset = fs.unions [
      ../docs
      ../mkdocs.yml
    ];
  };

  nativeBuildInputs = with pkgs; [
    mkdocs
    python3Packages.mkdocs-material
  ];

  buildPhase = "mkdocs build -d $out";
}
