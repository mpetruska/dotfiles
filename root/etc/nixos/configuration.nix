{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachix.nix
    ];

  # Enable automatic updating of the system
  system.autoUpgrade.enable = false;

  # Boot settings.
  boot = {

    initrd = {
      # Disable journaling check on boot because virtualbox doesn't need it
      # checkJournalingFS = false;
    };

    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelModules = [ "fuse" "kvm-intel" "coretemp" ];
    # extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

  };

  # Enable networking.
  networking = {
    hostName = "Dell5490"; # Define your hostname.
    # hostId = # (use whatever was generated)
    networkmanager.enable    = true;
    firewall.allowedTCPPorts = [ 8010 ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.etc.current-nixos-config.source = ./.;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # General
    curl
    neofetch
    vim
    wget
    gnome3.zenity

    # Environment
    compton
    direnv
    dmenu
    feh
    gnome3.adwaita-icon-theme
    haskellPackages.iwlib
    haskellPackages.xmobar
    i3lock
    killall
    libnotify
    networkmanager_dmenu
    twmn
    xorg.xbacklight
    xorg.xgamma

    # Basic packages
    git
  ];

  # security.wrappers.slock.source = "${pkgs.slock.out}/bin/slock";

  fonts = {
    # enableCoreFonts        = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      bakoma_ttf
      corefonts
      dejavu_fonts
      dina-font
      fira-code
      fira-code-symbols
      fira-mono
      font-awesome
      inconsolata
      liberation_ttf
      meslo-lg
      monoid
      # mplus-outline-fonts
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      oxygenfonts
      proggyfonts
      terminus_font
      ubuntu_font_family
    ];
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  programs = {
    adb.enable            = true;
    bash.enableCompletion = true;
    zsh.enable            = true;
    seahorse.enable       = true;
    dconf.enable          = true;
    
    ssh.askPassword = pkgs.lib.mkForce "${pkgs.libsForQt5.ksshaskpass.out}/bin/ksshaskpass";
  };

  location = {
    latitude  = 47.4979;
    longitude = 19.0402;    
  };

  # List services that you want to enable.
  services = {

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    udev.extraRules = ''
        # HW.1 / Nano
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c|2b7c|3b7c|4b7c", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c|2b7c|3b7c|4b7c", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # Blue
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000|0000|0001|0002|0003|0004|0005|0006|0007|0008|0009|000a|000b|000c|000d|000e|000f|0010|0011|0012|0013|0014|0015|0016|0017|0018|0019|001a|001b|001c|001d|001e|001f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000|0000|0001|0002|0003|0004|0005|0006|0007|0008|0009|000a|000b|000c|000d|000e|000f|0010|0011|0012|0013|0014|0015|0016|0017|0018|0019|001a|001b|001c|001d|001e|001f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # Nano S
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001|1000|1001|1002|1003|1004|1005|1006|1007|1008|1009|100a|100b|100c|100d|100e|100f|1010|1011|1012|1013|1014|1015|1016|1017|1018|1019|101a|101b|101c|101d|101e|101f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001|1000|1001|1002|1003|1004|1005|1006|1007|1008|1009|100a|100b|100c|100d|100e|100f|1010|1011|1012|1013|1014|1015|1016|1017|1018|1019|101a|101b|101c|101d|101e|101f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # Aramis
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0002|2000|2001|2002|2003|2004|2005|2006|2007|2008|2009|200a|200b|200c|200d|200e|200f|2010|2011|2012|2013|2014|2015|2016|2017|2018|2019|201a|201b|201c|201d|201e|201f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0002|2000|2001|2002|2003|2004|2005|2006|2007|2008|2009|200a|200b|200c|200d|200e|200f|2010|2011|2012|2013|2014|2015|2016|2017|2018|2019|201a|201b|201c|201d|201e|201f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # HW2
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0003|3000|3001|3002|3003|3004|3005|3006|3007|3008|3009|300a|300b|300c|300d|300e|300f|3010|3011|3012|3013|3014|3015|3016|3017|3018|3019|301a|301b|301c|301d|301e|301f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0003|3000|3001|3002|3003|3004|3005|3006|3007|3008|3009|300a|300b|300c|300d|300e|300f|3010|3011|3012|3013|3014|3015|3016|3017|3018|3019|301a|301b|301c|301d|301e|301f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # Nano X
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004|4000|4001|4002|4003|4004|4005|4006|4007|4008|4009|400a|400b|400c|400d|400e|400f|4010|4011|4012|4013|4014|4015|4016|4017|4018|4019|401a|401b|401c|401d|401e|401f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004|4000|4001|4002|4003|4004|4005|4006|4007|4008|4009|400a|400b|400c|400d|400e|400f|4010|4011|4012|4013|4014|4015|4016|4017|4018|4019|401a|401b|401c|401d|401e|401f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
        # Ledger Test
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0005|5000|5001|5002|5003|5004|5005|5006|5007|5008|5009|500a|500b|500c|500d|500e|500f|5010|5011|5012|5013|5014|5015|5016|5017|5018|5019|501a|501b|501c|501d|501e|501f", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0005|5000|5001|5002|5003|5004|5005|5006|5007|5008|5009|500a|500b|500c|500d|500e|500f|5010|5011|5012|5013|5014|5015|5016|5017|5018|5019|501a|501b|501c|501d|501e|501f", TAG+="uaccess", TAG+="udev-acl", GROUP="plugdev"
      '';

    # Enable the X11 windowing system.
    xserver = {

      enable     = true;
      layout     = "us, hu";
      xkbOptions = "grp:alt_shift_toggle";

      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          middleEmulation    = false;
          tappingDragLock    = false;
        };
      };

      displayManager = {
        defaultSession = "none+xmonad";
        gdm    .enable = false;
        lightdm.enable = false;
        sddm   .enable = true;
        # slim   .enable = false;
        xpra   .enable = false;
        sessionCommands = ''
	
          # run ssh-agent
          killall ssh-agent
          eval "$(ssh-agent -s)"

          # fix for java vs non-reparenting window managers
          export _JAVA_AWT_WM_NONREPARENTING=1
        '';
      };

      desktopManager = {
        # default              = "none";
        enlightenment.enable = false;
        gnome        .enable = false;
        kodi         .enable = false;
        lumina       .enable = false;
        lxqt         .enable = false;
        mate         .enable = false;
        # maxx         .enable = false;
        pantheon     .enable = false;
        plasma5      .enable = true;
        xfce         .enable = false;
        xterm        .enable = true;
      };

      windowManager = {

        # default = "xmonad";
        xmonad = {
          enable                 = true;
          enableContribAndExtras = true;
          extraPackages = haskellPackages: [
            haskellPackages.xmobar
            haskellPackages.xmonad-contrib
            haskellPackages.xmonad-extras
          ];
        };

      };

    };

    redshift = {
      enable            = true;
      temperature.day   = 5700;
      temperature.night = 3500;
    };

    unclutter = {
      enable  = true;
      timeout = 1;
    };

    gnome = {
      gnome-keyring.enable = true;
      at-spi2-core.enable  = true;
    };

    lorri.enable = true;

  };

  security.pam.services.sddm.enableGnomeKeyring = true;

  # Virtualization stuff
  virtualisation = {

    virtualbox.host.enable = true;
    docker         .enable = true;

  };

  # Enable sound.
  sound.enable = true;
  
  hardware = {

    bluetooth = {
      enable   = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    opengl = {
      enable          = true;
      driSupport32Bit = true;
    };

    pulseaudio = {
      enable       = true;
      extraConfig = "
        load-module module-switch-on-connect
      ";
      #extraModules = [ pkgs.pulseaudio-modules-bt ];
      package      = pkgs.pulseaudioFull;
    };
    
  };

  users.groups.plugdev = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mark = {
    isNormalUser = true;
    group        = "users";
    home         = "/home/mark";
    extraGroups  = [ "wheel" "networkmanager" "docker" "vboxusers" "adbusers" "plugdev" ];
    shell        = pkgs.zsh;
  };

  nix = {
    trustedUsers          = [ "root" "mark" ];

    binaryCaches          = [ "https://hydra.iohk.io" "https://iohk.cachix.org" ];
    binaryCachePublicKeys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];

    settings = {
      substituters        = [ "https://hydra.iohk.io" "https://iohk.cachix.org" ];
      trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];
    };

    package               = pkgs.nixFlakes;
    extraOptions          = ''
      experimental-features = nix-command flakes
    '';

  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
