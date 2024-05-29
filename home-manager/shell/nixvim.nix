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
    opts = {
      number = true;
      relativenumber = true;
    };
    defaultEditor = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    plugins = {
      treesitter.enable = true;

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
        };
      };

      cmp = {
        enable = true;
	settings = {
	  mapping = {
          "<UP>" = "cmp.mapping.select_prev_item()";
          "<DOWN>" = "cmp.mapping.select_next_item()";
          "<C-UP>" = "cmp.mapping.scroll_docs(-4)";
          "<C-DOWN>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
	  };
	  sources = [
            {"name" = "nvim_lsp"; }
            {"name" = "path"; }
            {"name" = "buffer"; }
	  ];
	};
      };

      lsp-format.enable = true;

      telescope.enable = true;

      lualine.enable = true;
    };
  };
}
