# thanks NotAShelf https://github.com/NotAShelf/nyx/blob/main/parts/pre-commit/utils.nix
{lib, ...}: let
  inherit (lib.attrsets) recursiveUpdate;

  excludes = ["flake.lock"];

  presetConfigFor = name: {
    inherit excludes;
    description = "pre-commit hook for ${name}";
    verbose = true;
  };

  mkHook = name: hookConfig: recursiveUpdate (presetConfigFor name) hookConfig;
in {
  src = ../.;

  hooks = {
    alejandra = mkHook "alejandra" {
      enable = true;
    };

    editorconfig-checker = mkHook "editorconfig-checker" {
      enable = true;
    };
  };
}
