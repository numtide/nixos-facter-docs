{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    mkdocs
    python3Packages.mkdocs-material
  ];
}
