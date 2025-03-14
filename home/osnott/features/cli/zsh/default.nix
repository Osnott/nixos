{
  lib,
  config,
  ...
}:
# let
#  inherit (lib) mkIf;
#  packageNames = map (p: p.pname or p.name or null) config.home.packages;
#  hasPackage = name: lib.any (x: x == name) packageNames;
#  hasEza = hasPackage "eza";
#in
{
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "eza --icons";
      lsl = "eza -l --icons";
      lsa = "eza -a --icons";

      nrs = "nixos-rebuild switch --flake .";
      snrs = "sudo nixos-rebuild switch --flake .";
    };
  };
}
