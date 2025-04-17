{...}: {
  programs.starship = {
    enable = true;
    settings = {
      # why do you make me do this. just have the same options as nixos ugh.

      aws = {
        symbol = "  ";
      };

      buf = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      cmake = {
        symbol = " ";
      };

      conda = {
        symbol = " ";
      };

      crystal = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      docker_context = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      fennel = {
        symbol = " ";
      };

      fossil_branch = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      git_commit = {
        tag_symbol = "  ";
      };

      golang = {
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
      };

      haskell = {
        symbol = " ";
      };

      haxe = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      kotlin = {
        symbol = " ";
      };

      lua = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      meson = {
        symbol = "󰔷 ";
      };

      nim = {
        symbol = "󰆥 ";
      };

      nix_shell = {
        symbol = " ";
      };

      nodejs = {
        symbol = " ";
      };

      ocaml = {
        symbol = " ";
      };

      os = {
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CachyOS = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          Nobara = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };
      };

      package = {
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      pijul_channel = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rlang = {
        symbol = "󰟔 ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = "󱘗 ";
      };

      scala = {
        symbol = " ";
      };

      swift = {
        symbol = " ";
      };

      zig = {
        symbol = " ";
      };

      gradle = {
        symbol = " ";
      };

      character = {
        success_symbol = "[🦊➜](bold green)";
        error_symbol = "[🦊➜](bold red)";
      };
    };
  };
}
