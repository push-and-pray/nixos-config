{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
    };
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
      "<leader><space>" = {
        action = "file_browser";
        options = {
          desc = "File Browser";
        };
      };
      "<leader>/" = {
        action = "live_grep";
        options = {
          desc = "Grep (root dir)";
        };
      };
      "<leader>:" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>ff" = {
        action = "file_browser";
        options = {
          desc = "File Browser";
        };
      };
      "<leader>fr" = {
        action = "live_grep";
        options = {
          desc = "Find text";
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
