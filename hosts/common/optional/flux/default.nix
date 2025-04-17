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
      prominence-2-he = {
        package = pkgs.mkMinecraftServer {
          name = "prominence-2-he";
          src = ./servers/mc/prominence_2;
          hash = "sha256-wBhrAIQgqZjc9AZQCdALyfvOjtV1ZM9jGRqJENgMS1o=";
        };

        proxy = {
          enable = true;

          backend = "playit";
        };
      };
    };
  };
}
