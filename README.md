# nixos-facter-docs

This repository contains documentation for [nixos-facter][facter-repo] and [nixos-facter-modules][facter-modules-repo].

## Navigating the documentation

This repository uses [Diátaxis][diataxis] as a framework to organize documentation.
Individual documents are split by content type in `./docs`:

-   Explanation
-   Tutorial
-   How-to
-   Reference

## Building the documentation

> [!IMPORTANT]  
> Building the documentation requires your Nix installation to support flakes.
> Consult the [NixOS Wiki page on flakes][enable-flakes] for more information.

1.  Clone this repository.
2.  Change directory to the repository.
2.  Run `nix build`.

The built documentation site is located in `./result`.

## License

The contents of this repository are licensed under the terms of the [Creative Commons Attribution-ShareAlike 4.0 International](./LICENSE.txt) license.

[facter-repo]: https://github.com/numtide/nixos-facter
[facter-modules-repo]: https://github.com/numtide/nixos-facter-modules
[diataxis]: https://diataxis.fr/
[enable-flakes]: https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled#enable-nix-flakes