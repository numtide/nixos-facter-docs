{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    mkdocs
    python3Packages.mkdocs-material
    python3Packages.mkdocs-mermaid2-plugin
  ];
}
