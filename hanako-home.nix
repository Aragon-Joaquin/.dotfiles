{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "hanako";
  home.homeDirectory = "/home/hanako";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    tree
  ];

  programs.git = {
    enable = true;
    userName = "RandomBlizzard";
    userEmail = "blizzardrandom@gmail.com";
  };

  programs.bash.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.nvim-treesitter
  ];

  xdg.configFile."nvim" = {
  	source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/global/nvim/.config/nvim";
    recursive = true;
  };
}
