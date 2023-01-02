{ user, ... }: {
  # xdg.configFile = {
  #   "zellij" = {
  #     recursive = true;
  #     source = ./zellij;
  #   };
  # };
  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      default_shell = "nu";
      pane_frames = false;
      theme = "catppuccin-mocha";
      keybinds = {
        # "shared_except \"locked\"" = {
        #   bind = [
        #     "Alt q"
        #     { CloseFocus = null; }
        #   ];
        # };
        "shared_except \"move\" \"locked\"" = {
          bind = [
            "Ctrl m"
            { SwitchToMode = "Move"; }
          ];
        };
      };
    };
  };
}
