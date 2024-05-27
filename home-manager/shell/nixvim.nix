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
      lsp-format.enable = true;

      telescope.enable = true;

      lualine.enable = true;
    };
  };
}
