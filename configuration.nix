# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./nixos/hardware-configuration.nix
  ];

  #NOTE: system global
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "wlr"
          "gtk"
        ];
      };
    };
  };

  #keyboard & fonts
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
    useXkbConfig = false; # use xkb.options in tty.
  };
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    nerd-fonts.inconsolata
  ];

  #NOTE:hardware
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      #intel-compute-runtime
      intel-vaapi-driver
      vpl-gpu-rt
    ];
  };
  hardware.pulseaudio.enable = false;

  #NOTE: boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1p1";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelParams = [
  #   "quiet"
  #   "splash"
  # ];

  #NOTE: network
  networking.hostName = "nixos_btw";
  networking.networkmanager.enable = true; # nmcli & nmtui.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  #NOTE: users
  users.users.hanako = {
    isNormalUser = true;
    description = "Hanako Urawa";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "render"
      "pipewire"
    ];
    shell = pkgs.bash;
    password = "password"; # change this with 'passwd'
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    #utils
    wget
    stow
    curl
    btop
    unzip

    #programming
    vim
    tmux
    neovim
    ripgrep
    fd
    gnumake
    tree-sitter
    git
    delta

    #languages
    gcc
    nodejs
    clang
    jdk
    luarocks
    lua
    cargo
    rustc
    go
    ruby
    php
    python3

    #desktop enviroment and utilities
    wayland
    mangowc
    waybar
    swaybg
    rofi
    rtkit
    ly
    playerctl

    #userland
    alacritty
    firefox
    sof-firmware # sound open firmware
    pipewire
    pavucontrol
    awww
    wl-clipboard
  ];

  #NOTE: programs
  programs.mangowc = {
    enable = true;
  };
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # vim > nano
  programs.vim.enable = true;
  environment.variables.EDITOR = "vim";
  programs.nano.enable = false;
  programs.firefox.enable = true;

  #NOTE: services
  services.libinput.enable = true;
  services.xserver.xkb.layout = "latam";
  security.rtkit.enable = true;
  services.dbus.enable = true;
  services.openssh.enable = true;
  services.displayManager = {
    ly = {
      enable = true;
      settings = {
        clear_password = true;
        auto_login = true;
        default_user = "hanako";
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
    systemWide = true;
    extraConfig = {
      pipewire."99-silent-bell.conf" = {
        "context.properties" = {
          "module.x11.bell" = false;
        };
      };
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
