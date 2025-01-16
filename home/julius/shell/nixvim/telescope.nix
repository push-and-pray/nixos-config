{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader>/" = {
        action = "live_grep";
        options = {
          desc = "Grep";
        };
      };
      "<leader>:" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>fr" = {
        action = "live_grep";
        options = {
          desc = "Grep";
        };
      };
      "<leader>fo" = {
        action = "oldfiles";
        options = {
          desc = "Recent";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<leader>bf" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Search git files";
        };
      };
      "<leader>fd" = {
        action = "diagnostics";
        options = {
          desc = "Workspace diagnostics";
        };
      };
    };
  };
}
