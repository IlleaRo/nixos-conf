{ config, pkgs, ... }: {
	home = {
		username = "illearo";
		homeDirectory = "/home/illearo";
		stateVersion = "24.11";
	};
	
	imports = [
		./modules/bash.nix
	];
}
