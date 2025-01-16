{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./git.nix
    ./lsp.nix
    ./telescope.nix
    ./extraplugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    clipboard = {
      register = "unnamedplus";
    };
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      smartindent = true;
      shiftwidth = 2;

      breakindent = true;

      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals

      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];

      swapfile = false;
      backup = false;
      undofile = true;

      cursorline = true;
      termguicolors = true;
      scrolloff = 8;
      showmode = false;

      splitbelow = true;
      splitright = true;
    };

    plugins = {
      marks = {
        enable = true;
        mappings = {
          "previous" = "<leader>,";
          "next" = "<leader>.";
        };
      };
      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<C-t>]]";
        };
      };
      lightline.enable = true;

      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };
      };

      web-devicons.enable = true;

      comment.enable = true;
      nvim-colorizer.enable = true;
      which-key.enable = true;
      nvim-autopairs.enable = true;
      notify.enable = true;

      mini = {
        enable = true;
        modules = {
          files = {
            mappings = {
              synchronize = "<leader><leader>";
            };
          };
        };
      };
    };
    keymaps = [
      {
        action = "<cmd>lua MiniFiles.open()<CR>";
        key = "<leader><leader>";
        options.desc = "Files";
      }
    ];
  };
}
