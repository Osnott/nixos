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

      add_newline = true;

      format = "($nix_shell$container$fill$git_metrics\n)$cmd_duration$hostname$localip$shlvl$shell$env_var$jobs$sudo$username$character";

      right_format = "$singularity\$kubernetes\$directory\$vcsh\$fossil_branch\$git_branch\$git_commit\$git_state\$hg_branch\$pijul_channel\$docker_context\$package\$c\$cmake\$cobol\$daml\$dart\$deno\$dotnet\$elixir\$elm\$erlang\$fennel\$golang\$guix_shell\$haskell\$haxe\$helm\$java\$julia\$kotlin\$gradle\$lua\$nim\$nodejs\$ocaml\$opa\$perl\$php\$pulumi\$purescript\$python\$raku\$rlang\$red\$ruby\$rust\$scala\$solidity\$swift\$terraform\$vlang\$vagrant\$zig\$buf\$conda\$meson\$spack\$memory_usage\$aws\$gcloud\$openstack\$azure\$crystal\$custom\$status\$os\$battery\$time";

      fill = {
        symbol = " ";
      };

      directory = {
        home_symbol = "⌂";
        truncation_length = 2;
        truncation_symbol = "□ ";
        read_only = " 󰌾";
        use_os_path_sep = true;
        style = "italic blue";
        format = "[$path]($style)[$read_only]($read_only_style)";
        repo_root_style = "bold blue";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
      };

      time = {
        disabled = false;
        format = "[ $time]($style)";
        time_format = "%R";
        utc_time_offset = "-7";
        style = "italic dimmed white";
      };

      username = {
        style_user = "bright-yellow bold italic";
        style_root = "purple bold italic";
        format = "[$user ]($style)";
        disabled = false;
        show_always = false;
      };

      hostname = {
        ssh_only = true;
        ssh_symbol = " ";
        format = "[$hostname$ssh_symbol]($style) ";
        style = "bold dimmed blue";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style)";
      };
    };
  };
}
