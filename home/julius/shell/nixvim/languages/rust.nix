{...}: {
  programs.nixvim = {
    plugins = {
      rustaceanvim = {
        enable = true;
      };
      crates-nvim.enable = true;
    };
  };
}
