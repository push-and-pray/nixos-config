_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "62392537+push-and-pray@users.noreply.github.com";
        name = "push-and-pray";
      };
      pull = {
        rebase = true;
      };
    };
  };

  programs.lazygit.enable = true;
}
