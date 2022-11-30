hyprland: _: super: 
let
  
in
{
  discord-openasar = super.discord.override { 
    nss = super.nss_latest; withOpenASAR = true;
  };
  helix-desktop = super.makeDesktopItem {
    name = "helix";
    desktopName = "Helix (TUI)";
    genericName = "Helix";
    exec = "wezterm start hx %F";
    mimeTypes = [ "text/plain" "inode/directory" ];
    categories = [ "Utility" "TextEditor" "Development" ];
  };
  # hyprland-hidpi = super.symlinkJoin {
  #   name = "hyprland-hidpi";
  #   # paths = [ hyprland.packages.${super.system}.default ];
  #   paths = [ super.hyprland ];
  #   buildInputs = [ super.makeWrapper ];
  #   postBuild = ''
  #     wrapProgram $out/bin/Hyprland --set GDK_SCALE 2 --set XCURSOR_SIZE 64
  #   '';
  # };
  hyprland-nvidia = super.hyprland.override {nvidiaPatches = true;};
}