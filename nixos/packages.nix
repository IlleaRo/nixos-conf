{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    alacritty
    hyprland
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {})
  ];
}
