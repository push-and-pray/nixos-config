{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      otter.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
          gopls.enable = true;
          zls.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>E" = {
              action = "open_float";
              desc = "Show diagnostics";
            };
            "<A-k>" = {
              action = "goto_prev";
              desc = "Goto Previous Error";
            };
            "<A-j>" = {
              action = "goto_next";
              desc = "Goto Next Error";
            };
          };
          lspBuf = {
            K = {
              action = "hover";
              desc = "Hover";
            };
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename Symbol";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Action";
            };
          };
        };
      };
      nvim-lightbulb.enable = true;

      none-ls = {
        enable = true;
        enableLspFormat = true;

        sources = {
          code_actions = {
            statix.enable = true;
            gitrebase.enable = true;
            gitsigns.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            yamllint.enable = true;
            trivy.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            prettier.enable = true;
            black.enable = true;
            isort.enable = true;
            gofmt.enable = true;
          };
        };
      };

      trouble.enable = true;
      fidget.enable = true;

      lsp-format.enable = true;

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft.rust = ["rustfmt"];
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          notify_on_error = true;
        };
      };
      rustaceanvim = {
        enable = true;
        settings = {
          tools.enable_clippy = true;
          server = {
            default_settings = {
              inlayHints = {lifetimeElisionHints = {enable = "always";};};
              rust-analyzer = {
                cargo = {allFeatures = true;};
                check = {command = "clippy";};
              };
            };
          };
        };
      };
    };
  };
}
