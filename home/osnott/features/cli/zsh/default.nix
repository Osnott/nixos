{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  packageNames = map (p: p.pname or p.name or null) config.home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
  hasEza = hasPackage "eza";
  hasTmux = hasPackage "tmux";
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

      tl = mkIf hasTmux "tmux list-sessions";
      ta = mkIf hasTmux "tmux attach-session -t ";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild switch --flake .";
      snr = "sudo nixos-rebuild --flake .";
      snrs = "sudo nixos-rebuild switch --flake .";

      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };
  };
}
