{ pkgs, inputs, ... }:
inputs.treefmt-nix.lib.mkWrapper pkgs {
  projectRootFile = ".git/config";

  programs = {
    nixfmt.enable = true;
    deadnix.enable = true;
    gofumpt.enable = true;
    prettier.enable = true;
    statix.enable = true;
  };

  settings = {
    global.excludes = [
      "LICENSE.txt"
      # unsupported extensions
      "*.{gif,png,svg,tape,mts,lock,mod,sum,toml,env,envrc,gitignore}"
    ];

    formatter = {
      deadnix = {
        priority = 1;
      };

      statix = {
        priority = 2;
      };

      nixfmt = {
        priority = 3;
      };

      prettier = {
        options = [
          "--tab-width"
          "2"
        ];
        includes = [ "*.{css,html,js,json,jsx,md,mdx,scss,ts,yaml}" ];
      };
    };
  };
}
