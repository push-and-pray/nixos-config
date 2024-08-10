{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil-ls.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
        };
      };

      none-ls = {
        enable = true;
        enableLspFormat = true;

        sources = {
          code_actions = {
            statix.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            yamllint.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };
      };

      trouble.enable = true;
      fidget.enable = true;

      lsp-format.enable = true;
    };
  };
}
