[![build status](https://img.shields.io/github/actions/workflow/status/Osnott/nixos/flake.yml)](https://github.com/Osnott/nixos/actions)

# NixOS configuration

general structure of my configuration is taken from [Misterio77](https://github.com/Misterio77) on GitHub. both their [starter config repo](https://github.com/Misterio77/nix-starter-config) and [personal configuration](https://github.com/Misterio77/nix-config) were very helpful for setting this up. also thanks to [NotAShelf](https://github.com/NotAShelf) and all of his stuff for nix and nixos.

## Structure

- `flake.nix`: entrypoint for host and home configurations
- `hosts`: NixOS configurations for individual hosts
    - `common`: shared configurations accessible by all hosts
        - `global`: configurations applied to all hosts
        - `optional`: configurations that are opt-in by host
    - `taffy`: home server - headless
- `home`: home-manager configurations for individual users, configurable by host
- `modules`: custom modules (*in progress*)
- `overlays`: patches and overrides for pkgs (*in progress*)
- `pkgs`: custom pkgs (*in progress*)

## Branches

- `main`: stable configuration
- `devel`: development configuration. used for checking configurations for other hosts and staging and such

## WIP

this whole configuration is a work in progress. check [TODO.md](https://github.com/Osnott/nixos/blob/main/TODO.md) to see the things that i am working on

