{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  packageNames = map (p: p.pname or p.name or null) config.home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
  hasEza = hasPackage "eza";
in {
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = mkIf hasEza "eza --icons";
      lsl = mkIf hasEza "eza -l --icons";
      lsa = mkIf hasEza "eza -a --icons";

      nrs = "nixos-rebuild switch --flake .";
      snrs = "sudo nixos-rebuild switch --flake .";
    };
  };
}
