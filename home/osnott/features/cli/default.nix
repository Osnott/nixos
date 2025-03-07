{pkgs, ...}: {
  imports = [
    ./zsh

    ./git.nix
  ];

  home.packages = with pkgs; [
    htop # system viewer
    eza # better ls
    ripgrep # better grep
    alejandra # nix formatter
  ];
}
