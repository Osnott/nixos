# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  flux = inputs.flux.overlays.default;

  nvchad4nix = final: _: {
    nvchad4nix = inputs.nvchad4nix.packages."${final.system}".nvchad;
  };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  stable = final: _: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };
}
