{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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

  security.wrappers.slock.source = "${pkgs.slock.out}/bin/slock";

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
      font-awesome-ttf
      inconsolata
      liberation_ttf
      meslo-lg
      monoid
      mplus-outline-fonts
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

  };

  security.pam.services.sddm.enableGnomeKeyring = true;

  # Virtualization stuff
  virtualisation = {

    virtualbox.host.enable = true;
    docker         .enable = true;

  };

  # Enable sound.
  sound.enable = true;
  
  hardware.pulseaudio = {
    enable = true;

    # Extra bluetooth profiles
    extraModules = [ pkgs.pulseaudio-modules-bt ];

    # NixOS allows either a lightweight build (default) or full build of PulseAudio to be installed.
    # Only the full build has Bluetooth support, so it must be selected here.
    package = pkgs.pulseaudioFull;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mark = {
    isNormalUser = true;
    group        = "users";
    home         = "/home/mark";
    extraGroups  = [ "wheel" "networkmanager" "docker" "vboxusers" "adbusers" ];
    shell        = pkgs.zsh;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
