{ pkgs, user, ... }: {
  imports = [ ./common/system.nix ];

  environment.systemPackages = with pkgs; [
    # Work
    slack
    thunderbird
    brightnessctl
  ];

  home-manager.users.${user}.imports = [
    ./common/home.nix
    ../programming
  ];
}
