{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
        };
      };
      none-ls = {
        enable = true;
        sources = {
          formatting = {
            black.enable = true;
            isort.enable = true;
          };
        };
      };
    };
  };
}
