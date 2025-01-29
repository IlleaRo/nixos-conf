{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    alacritty

    hyprland
  ];
}
