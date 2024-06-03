{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = guess-indent-nvim;
        config = ''
          lua require('guess-indent').setup {}
        '';
      }
    ];

    globals.mapleader = " ";
    keymaps = [
      {
        key = "<leader>e";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle Filetree";
      }
      {
        key = "<leader>o";
        action = "<CMD>NvimTreeFocus<CR>";
        options.desc = "Focus Filetree";
      }
    ];
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      copyindent = true;
      breakindent = true;
    };
    defaultEditor = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    plugins = {
      treesitter = {
        enable = true;
        indent = true;
      };

      bufferline = {
        enable = true;
        offsets = [
          {
            filetype = "NvimTree";
            text = "Files";
            #text_align = "left";
            #seperator = true;
          }
        ];
      };
      lualine.enable = true;

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
        };
      };
      lsp-lines = {
        enable = true;
        currentLine = true;
      };

      which-key = {
        enable = true;
        registrations = {
          "<leader>f" = "Telescope";
          #"<leader>fg" = "Live Grep";
        };
      };

      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";
            "<C-f>" = "cmp.mapping.scroll_docs(-4)";
          };
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "treesitter";}
          ];
        };
      };

      lsp-format.enable = true;
      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting = {
            alejandra.enable = true;
            black.enable = true;
          };
        };
      };

      fidget = {
        enable = true;
      };

      nvim-autopairs.enable = true;
      nvim-tree = {
        enable = true;
        autoClose = true;
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "Live Grep";
            };
          };
          "<leader>ff" = {
            action = "git_files";
            options = {
              desc = "Search Git Files";
            };
          };
        };
      };
    };
  };
}
