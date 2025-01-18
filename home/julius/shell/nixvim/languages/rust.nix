{...}: {
  programs.nixvim = {
    plugins = {
      rustaceanvim = {
        enable = true;
        settings = {
          server = {
            default_settings = {
              rust-analyzer = {
                files.excludeDirs = [".direnv"];
                check = {
                  command = "clippy";
                };
                inlayHints = {
                  lifetimeElisionHints = {
                    enable = "always";
                  };
                };
              };
            };
          };
        };
      };
      crates-nvim.enable = true;
    };
  };
}
