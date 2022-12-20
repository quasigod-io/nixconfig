{ pkgs, lib, ... }:
let
  gmstart = pkgs.writeShellScriptBin "gmstart" ''
    echo 'always' | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
    polybar-msg action gamemode module_show
    togdnd -p
  '';
  gmstop = pkgs.writeShellScriptBin "gmstop" ''
    echo 'madvise' | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
    polybar-msg action gamemode module_hide
    togdnd -u
  '';
in
{
  environment.systemPackages = with pkgs; [
    gamescope
    winetricks
    protontricks
    grapejuice
    (lutris.override {
      lutris-unwrapped = lutris-unwrapped.override { wine = wine-tkg; };
      extraLibraries = pkgs: [ latencyflex ];
    })
    heroic
    goverlay
    mangohud
    prismlauncher
    minetest
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    gamemode = {
      enable = true;
      settings = {
        general = {
          reaper_freq = 5;
          defaultgov = "performance";
          softrealtime = "auto";
          renice = 0;
          ioprio = 0;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          nv_powermizer_mode = 1;
          amd_performance_level = "high";
        };
        custom = {
          start = "${gmstart}/bin/gmstart";
          end = "${gmstop}/bin/gmstop";
        };
      };
    };
  };
}
