{ config, pkgs, kickstart-nix-nvim, ... }:

{
  nixpkgs.overlays = [
    kickstart-nix-nvim.overlays.default
  ];

  home.packages = with pkgs; [
    nvim-pkg  # Основной пакет Neovim из оверлея
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      syntax on
      set tabstop=4 shiftwidth=4 expandtab
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nerdtree
      telescope-nvim
    ];
  };
}

