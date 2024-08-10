{...}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = true;
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
          {name = "emoji";}
          {
            name = "path";
            keywordLength = 3;
          }
          {
            name = "buffer";
            keywordLength = 3;
          }
        ];

        window = {
          completion = {
            border = "solid";
          };
          documentation = {
            border = "solid";
          };
        };
      };
    };

    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-emoji = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };

    lspkind = {
      enable = true;
    };
  };
}
