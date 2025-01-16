{...}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;
        perfomance = {
          debounce = 150;
        };

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
          {
            name = "path";
          }
          {
            name = "buffer";
            keywordLength = 3;
          }
        ];
      };
    };

    lspkind = {
      enable = true;
    };
  };
}
