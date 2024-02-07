# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: 
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModule
    ];

  networking = {
    hostName = "NixOSBook"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    wireguard.enable = false;
    wg-quick.interfaces = {
      wg0 = let secrets = builtins.import ./wireguard-secret.nix; in {
        address = [
          "10.8.0.3/32"
        ];
        peers = [
          {
            allowedIPs = [
              "0.0.0.0/0"
            ];
            endpoint = secrets.endpoint;
            publicKey = secrets.publicKey;
          }
        ];
        privateKey = secrets.privateKey;
        autostart = false;
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: { unstable = inputs.nixpkgs-unstable.legacyPackages.${super.system}; })
  ];

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
      theme = pkgs.callPackage grub-themes/fallout.nix {};
      gfxmodeEfi = "1920x1080";
    };
  };

  programs = {
    hyprland.enable = true;
    light.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    git.enable = true;
    neovim = {
      defaultEditor = true;
      withNodeJs = true;
    };
    java.enable = true;
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
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.iamnotagenius = { pkgs, ... }: {
    programs = {
      waybar = {
        systemd.enable = true;
      };
      tmux = {
        enable = true;
        baseIndex = 1;
        clock24 = true;
        customPaneNavigationAndResize = true;
        keyMode = "vi";
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        defaultKeymap = "viins";
        shellAliases = {
          lf = "ranger";
          ll = "ls -l";
          la = "ls -a";
          gs = "git status";
          gc = "git commit -m";
          gp = "git pull";
          gP = "git push";
          vim = "nvim";
          gvim = "neovide";
          sc = "systemctl";
          scu = "systemctl --user";
          mail = "neomutt";
          vpnenable = "doas systemctl start wg-quick-wg0.service";
          vpndisable = "doas systemctl stop wg-quick-wg0.service";
          myip = "curl ip.me";
        };
        history.path = "~/.histfile";
        plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "nix-shell";
          src = pkgs.zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
        ];
        initExtra = builtins.readFile ./zsh-extra.zsh;
      };
    };
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      extraConfig = builtins.readFile ./configs/hyprland.conf;
    };
    services = {
      syncthing.enable = true;
      udiskie = {
        enable = true;
        automount = true;
        notify = true;
        tray = "never";
      };
    };
    xdg.mimeApps.defaultApplications = {
      "www-browser" = [ "brave-browser.desktop" ];
      "x-www-browser" = [ "brave-browser.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    };
    home = {
      sessionVariables = {
        PATH = "$PATH:~/scripts";
        VISUAL = "nvim";
        EDITOR = "nvim";
        NEOVIDE_MULTIGRID = "1";
        LS_COLORS = "rs=0;35:di=01;35:ln=01;36:mh=00:pi=40;33:so=01;34:do=01;35:bd=01;33;04:cd=33;04:or=41;30;01;05:mi=00:su=37;41:sg=30;43:ca=30;41:tw=35;01:ow=35;01:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;34:*.jpeg=01;34:*.mjpg=01;34:*.mjpeg=01;34:*.gif=01;34:*.bmp=01;34:*.pbm=01;34:*.pgm=01;34:*.ppm=01;34:*.tga=01;34:*.xbm=01;34:*.xpm=01;34:*.tif=01;34:*.tiff=01;34:*.png=01;34:*.svg=01;34:*.svgz=01;34:*.mng=01;34:*.pcx=01;34:*.mov=01;34:*.mpg=01;34:*.mpeg=01;34:*.m2v=01;34:*.mkv=01;34:*.webm=01;34:*.webp=01;34:*.ogm=01;34:*.mp4=01;34:*.m4v=01;34:*.mp4v=01;34:*.vob=01;34:*.qt=01;34:*.nuv=01;34:*.wmv=01;34:*.asf=01;34:*.rm=01;34:*.rmvb=01;34:*.flc=01;34:*.avi=01;34:*.fli=01;34:*.flv=01;34:*.gl=01;34:*.dl=01;34:*.xcf=01;34:*.xwd=01;34:*.yuv=01;34:*.cgm=01;34:*.emf=01;34:*.ogv=01;34:*.ogx=01;34:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*rc=04;35:*.log=04;35;02";
        BEMENU_OPTS = "-n --fn 'Iosevka 16' -H 30 \
                       --cw 2 --ch 22 \
                       --hp 10 \
                       --tb #282C34 --tf #56B6C2 \
                       --fb #282C34 --ff #ABB2BF \
                       --nb #282C34 --nf #ABB2BF \
                       --ab #282C34 --af #ABB2BF \
                       --hb #383B41 --hf #98C379 \
                       --sb #E06C75";
      };
      packages = with pkgs; [
        unstable.brave
        calc
        calcurse
        cargo
        isync
        libreoffice
        imv
        jupyter
        lua-language-server
        mpv
        msmtp
        neomutt
        neovide
        nix-zsh-completions
        nodejs
        pass
        pinentry-bemenu
        python311Packages.pygments
        python311Packages.pandas
        python311Packages.numpy
        python311Packages.scipy
        python311Packages.matplotlib
        qutebrowser
        ranger
        sway-contrib.grimshot
        texlab
        telegram-desktop
        yadm
        wbg

        # List latex packages here
        (texlive.combine {
         inherit (texlive)
         scheme-tetex
         collection-binextra
         minted;
         })
      ];
      stateVersion = "23.11";
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraMono" "Iosevka" "Hack" "Hermit" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    bemenu
    btop
    dunst
    fzf
    gcc
    gh
    gnumake
    gnupg
    gojq
    htop
    indent
    keepassxc
    killall
    neovim
    nodejs
    pinentry-curses
    pulsemixer
    python311
    ripgrep
    seatd
    socat
    tor-browser-bundle-bin
    vimiv-qt
    waybar
    wget
    wl-clipboard
    xdg-utils
    yarn
    zathura
  ];

  # environment.variables = with pkgs; {
  #     LD_LIBRARY_PATH = "${lib.makeLibraryPath [stdenv.cc.cc]}";
  # };
  
  environment.pathsToLink = [ "/share/zsh" ];

  # List services that you want to enable:
  services = { 
    tlp.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    getty.autologinUser = "iamnotagenius";
    udisks2.enable = true;
    udev.extraRules = "ENV{ID_FS_USAGE}==\"filesystem|other|crypto\", ENV{UDISKS_FILESYSTEM_SHARED}=\"1\"";
    autossh.sessions = [
      {
        name = "syncthing-tunnel";
        user = "iamnotagenius";
        extraArguments = "-N -L 127.0.0.1:22001:127.0.0.1:22000 -R 127.0.0.1:22001:127.0.0.1:22000 main";
      }
    ];
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
  system.stateVersion = "23.11"; # Did you read the comment?
}
