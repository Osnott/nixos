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
      # prominence-2-he = {
      #   package = pkgs.mkMinecraftServer {
      #     name = "prominence-2-he";
      #     src = ./servers/mc/prominence_2;
      #     hash = "sha256-wBhrAIQgqZjc9AZQCdALyfvOjtV1ZM9jGRqJENgMS1o=";
      #   };
      #
      #   proxy = {
      #     enable = true;
      #
      #     backend = "playit";
      #   };
      # };

      atm9 = {
        package = pkgs.mkGenericServer {
          name = "atm9";

          src = ./servers/mc/atm9-server-configured.tar.gz;

          hash = "sha256-kN4DQpcMhmGg0HJfNU2xXExR/CpLJ7E98h+dvufBi14=";

          nativeBuildInputs = [
            pkgs.jre
            pkgs.jre8
          ];

          buildInputs = [
            pkgs.jre
            pkgs.jre8
          ];

          buildPhase = ''
            HOME=$TMPDIR
            cp -r . $out
          '';

          startCmd = "./startserver.sh";
        };

        proxy = {
          enable = true;

          backend = "playit";
        };
      };
    };
  };
}
