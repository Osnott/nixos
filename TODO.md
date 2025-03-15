# TODO

## flake

- [x] fix flake systems building, use [nix-systems](https://github.com/nix-systems/default-linux) as input
- [x] configure [flux](https://github.com/IogaMaster/flux) as a flake input

## hosts

### taffy

- [-] minecraft configuration *possibly via a module?*
    - using [flux](https://github.com/IogaMaster/flux)
- [ ] possible nas setup?

## home

### nvf

- [-] fix binds using nvf's custom lib functions
    - those lib functions turn out to be used for plugin definitions.
- [x] fix bufferline icon issues
    - turns out not icon issues, was just showing the id of the buffer. still ugly, removed it
- [ ] fix notification conflicts
- [ ] fix overlapping keybinds

## pkgs

- [ ] add playit from [playit.gg](https://playit.gg/)
    - [nixpkgs pr](https://github.com/NixOS/nixpkgs/pull/294103) *might need to define this as a service?*
