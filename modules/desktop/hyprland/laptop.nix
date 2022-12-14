{ lib, pkgs, user, ... }: {
  imports = [ ./default.nix ];
  environment.sessionVariables = {
    GDK_SCALE = "2";
    XCURSOR_SIZE = "64";
  };
  home-manager.users.${user} = {
    xdg.configFile = {
      hypr = {
        source = ./hypr;
        recursive = true;
      };
      waybar = {
        source = ./waybar;
        recursive = true;
      };
    };
    home.pointerCursor.x11.enable = false;
  };
}
