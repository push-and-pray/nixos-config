{config, ...}: {
  programs.nixvim = {
    plugins = {
      gitlinker = {
        enable = true;
        printUrl = false;
      };
      gitsigns = {
        enable = true;
        settings = {
          trouble = config.programs.nixvim.plugins.trouble.enable;
          current_line_blame = true;
        };
      };

      lazygit.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit ";
        };
      }
    ];
  };
}
