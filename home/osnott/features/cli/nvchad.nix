{inputs, pkgs, ...}: {
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      lua-language-server
      clang-tools
    ];
    hm-activation = true;
  };
}
