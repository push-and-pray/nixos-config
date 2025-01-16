{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
        };
      };
      none-ls = {
        enable = true;
        sources = {
          code_actions = {
            statix.enable = true;
          };
          diagnostics = {
            statix.enable = true;
          };
          formatting = {
            alejandra.enable = true;
          };
        };
      };
    };
  };
}
