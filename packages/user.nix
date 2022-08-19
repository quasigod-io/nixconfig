{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
    polybar
    picom
    betterlockscreen
    i3status
    shotgun
    hacksaw
    rofi
    nitrogen
    sxhkd
    cinnamon.nemo
    jetbrains-mono
    clifm
    jetbrains.idea-community
    jellyfin-media-player
    mullvad-vpn
    wmctrl
    tetrio-desktop
    selectdefaultapplication
  ];
}