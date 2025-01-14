{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.cinnamon-nvim;
        config = ''
          lua require("cinnamon").setup{keymaps = {basic = true, extra = true, } }
        '';
      }
    ];
  };
}
