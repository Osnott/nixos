{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.flux.nixosModules.default
  ];

  flux = {
    enable = true;

    servers = {
      # taffy-default = {
      #   package = pkgs.mkMinecraftServer {
      #     name = "taffy-default";
      #     src = ./servers/mc/default;
      #     hash = "sha256-C50y0s3N/R2UpFBjf0yiINB7oUjphv0xN9EzPM+2+lk=";
      #   };
      #
      #   proxy = {
      #     enable = true;
      #
      #     backend = "playit";
      #   };
      # };
    };
  };
}
