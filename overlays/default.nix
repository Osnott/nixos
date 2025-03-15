# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  flux = inputs.flux.overlays.default;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    playit = prev.playit.overrideAttrs (finalAttrs: oldAttrs: {
      cargoDeps = oldAttrs.cargoDeps.overrideAttrs (prev.lib.const {
        name = "${oldAttrs.pname}-${oldAttrs.version}-vendor.tar.gz";
        inherit (oldAttrs) src;
        outputHash = "sha256-Vf/uA64BUxxG1QRRHma+gARPJTrteOtU+gFSum2mJw4=";
      });
    });
  };

  stable = final: _: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };
}
