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
    ./bufferline.nix
    ./telescope.nix
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
      lualine.enable = true;

      treesitter = {
        enable = true;
        indent = true;
      };

      comment.enable = true;
      nvim-colorizer.enable = true;
      which-key.enable = true;
      nvim-autopairs.enable = true;
      notify.enable = true;

      hardtime = {
        enable = true;
        enabled = true;
        disableMouse = false;
      };
    };
  };
}
