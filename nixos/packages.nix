{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    alacritty
    hyprland
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {})

    # Basic
    unzip

    # Programming
    git
    gnumake
    gcc

    # Neovim
    ripgrep
    wayclip

  ];

xdg = {
		portal = {
			enable = true;
			extraPortals = with pkgs; [
				xdg-desktop-portal-wlr
				xdg-desktop-portal-gtk
			];
		};
	};
}
