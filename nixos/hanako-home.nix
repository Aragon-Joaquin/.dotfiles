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

  programs.delta = {
    enable = true;
    options = {
      side-by-side = true;
      navigate = true;
      line-numbers = true;
    };
  };

  programs.bash.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.nvim-treesitter
  ];

  #NOTE: copy from config
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/global/nvim/.config/nvim";
    recursive = true;
  };

  xdg.configFile."mango" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/desktop/mango/.config/mango";
    recursive = true;
  };

  xdg.configFile."rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/desktop/rofi/.config/rofi";
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/desktop/waybar/.config/waybar";
    recursive = true;
  };

  home.file.".tmux.conf".source =
    config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/global/tmux/.tmux.conf";

  xdg.configFile."alacritty" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/hanako/.dotfiles/global/alacritty/.config/alacritty";
    recursive = true;
  };

}
