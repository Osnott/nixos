{pkgs, ...}: {
  imports = [
    ./zsh
    ./nvf

    ./git.nix
    ./gh.nix
  ];

  home.packages = with pkgs; [
    htop # system viewer
    eza # better ls
    ripgrep # better grep
    alejandra # nix formatter
    nil # nix lsp
    lazygit # git tui tool
    mcman # minecraft server management cli tool
    packwiz # minecraft modpack managemer
    gnumake # make
    gcc11 # gcc11 (c++, g++, cc, gcc, ld, etc.)
  ];
}
