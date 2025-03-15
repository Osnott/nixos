{
  inputs,
  lib,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.nvim.binds) mkMappingOption;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  # most of this configuration was taken from the example config at https://github.com/NotAShelf/nvf/blob/main/configuration.nix

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };

        spellcheck = {
          enable = true;
        };

        lsp = {
          formatOnSave = true;
          lspkind.enable = false;
          lightbulb.enable = true;
          lspsaga.enable = false;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = true;
          lsplines.enable = false;
          nvim-docs-view.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          indent-blankline.enable = true;
          highlight-undo.enable = true;
        };

        statusline.lualine = {
          enable = true;
          theme = "catppuccin";
        };

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree.enable = true;
        };

        tabline.nvimBufferline = {
          enable = true;

          setupOpts.options = {
            numbers = "none";
            seperator_style = "slant";
          };
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        dashboard = {
          dashboard-nvim.enable = false;
          alpha.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };

          fastaction.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };

        notes = {
          todo-comments.enable = true;
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          clang.enable = true;
        };

        # TODO: move these to `mappings` via https://notashelf.github.io/nvf/index.xhtml#sec-custom-key-mappings

        keymaps = [
          {
            key = "<leader>e";
            mode = ["n"];
            action = ":Neotree focus<CR>";
            silent = true;
            desc = "Focus Neotree [Neotree]";
          }
          {
            key = "<leader>tf";
            mode = ["n"];
            action = ":ToggleTerm direction=float<CR>";
            silent = true;
            desc = "Open floating [Toggleterm]";
          }
          {
            key = "<leader>tv";
            mode = ["n"];
            action = ":ToggleTerm direction=vertical<CR>";
            silent = true;
            desc = "Open vertical [ToggleTerm]";
          }
          {
            key = "<leader>th";
            mode = ["n"];
            action = ":ToggleTerm direction=horizontal<CR>";
            silent = true;
            desc = "Open horizontal [ToggleTerm]";
          }
        ];
      };
    };
  };
}
