{
  pkgs,
  pname,
  perSystem,
  ...
}:
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
      ../overrides
      ../mkdocs.yml
    ];
  };

  nativeBuildInputs = with pkgs; [
    mkdocs
    python3Packages.mike
    python3Packages.mkdocs-material
    python3Packages.mkdocs-mermaid2-plugin
  ];

  postUnpack = ''
    # mkdocs-mermaid2-plugin tries to download mermaidjs at build time
    # instead we packaged up mermaid in this flake and we symlink it in
    # mkdocs.yml is configured to look for it there instead
    ln -s ${perSystem.self.mermaid} ./source/docs/js/mermaid
  '';

  buildPhase = "mkdocs build -d $out";
}
