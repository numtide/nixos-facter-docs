{ pkgs, perSystem, ... }:
pkgs.mkShellNoCC {
  shellHook = ''
    # mkdocs-mermaid2-plugin tries to download mermaidjs at runtime
    # instead we packaged up mermaid in this flake and we symlink it in
    # mkdocs.yml is configured to look for it there instead
    ln -sf ${perSystem.self.mermaid} docs/js/mermaid
  '';

  packages =
    with pkgs;
    [
      mkdocs
    ]
    ++ (with pkgs.python3Packages; [
      mike
      mkdocs-material
      mkdocs-mermaid2-plugin
    ]);
}
