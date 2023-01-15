# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "NixOSBook"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  documentation.man.generateCaches = true;
  
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      theme = let
        mikuChristmas = pkgs.stdenv.mkDerivation {
          pname = "miku-christmas-grub-theme";
          version = "1.3";
          src = pkgs.fetchFromGitHub {
            owner = "13atm01";
            repo = "GRUB-Theme";
            rev = "FSN-v1.3";
            hash = "sha256-miodp8rRZkhqVF/CIR0z8ADIw1OlodQJFjdKTsg0ZRs=";
          };
          installPhase = "cp -r \"Miku (Christmas Version)/Miku-Christmas-Version\" $out";
        };
        fallout = pkgs.fetchFromGitHub {
          owner = "imGabe";
          repo = "fallout-grub-theme";
          rev = "1636fbca54ec86e44bfc4c93b0d2e17b39d844b3";
          sha256 = "sha256-+yY9RlyjV6jcMmWHsNALIqr26cNJp+odXPOwfrPwnXI=";
        };
      in mikuChristmas;
      gfxmodeEfi = "1920x1080";
    };
  };

  programs = {
    sway.enable = true;
    light.enable = true;
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
    };
    git.enable = true;
    neovim = {
      defaultEditor = true;
      withNodeJs = true;
    };
  };

  security = {
    sudo.enable = false;
    doas.enable = true;
    doas.extraRules = [
      {
        groups = [ "wheel" ];
        noPass = false;
        keepEnv = true;
        persist = true;
      }
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.iamnotagenius = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      brave
      isync
      libreoffice
      msmtp
      neomutt
      neovide
      nix-zsh-completions
      nodejs
      pass
      pinentry-bemenu
      qutebrowser
      ranger
      sway-contrib.grimshot
      tdesktop
      yadm

      # List latex packages here
      (texlive.combine {
        inherit (texlive)
        scheme-tetex
        collection-binextra;
      })
    ];
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraMono" "Iosevka" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bemenu
    dunst
    fzf
    gcc
    gh
    gnumake
    gnupg
    htop
    indent
    jq
    killall
    neovim
    pinentry-curses
    seatd
    tor-browser-bundle-bin
    udiskie
    waybar
    wget
    wl-clipboard
    zathura
  ];

  # List services that you want to enable:
  services = { 
    openssh.enable = true;
    getty.autologinUser = "iamnotagenius";
    udisks2.enable = true;
    udev.extraRules = "ENV{ID_FS_USAGE}==\"filesystem|other|crypto\", ENV{UDISKS_FILESYSTEM_SHARED}=\"1\"";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
