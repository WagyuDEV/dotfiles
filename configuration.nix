# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, options, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # enable flakes and nix <command> syntax
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tank"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # networking.timeServers = options.networking.timeServers.default ++ [ 
  #  "0.north-america.pool.ntp.org"
  #  "1.north-america.pool.ntp.org"
  #  "2.north-america.pool.ntp.org"
  #  "3.north-america.pool.ntp.org" 
  # ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.opengl.enable = true;

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.swordfish = {
    isNormalUser = true;
    description = "swordfish";
    extraGroups = [ "networkmanager" "wheel" "audio" "serial" "video" "dialout" ];
    packages = with pkgs; [
      vscode
      neovim
      arduino-ide
      (python3.withPackages(ps: with ps; [ pyserial ])) 
      (discord.override { withVencord = true; })
      nitrogen
    ];
  };


  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu rofi i3status i3blocks picom ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    firefox
    alacritty
    bash
    zsh
    xdotool
    lm_sensors
    sysstat
    fastfetch
    flameshot
    gcc
    acpi
    usbutils
    blueman
  ];

  programs.git.enable = true; 
 
  programs.dconf.enable = true;

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
  
    shellAliases = {
      la = "ls -a";
      ll = "ls -l";
      sysconf = "sudo vim /etc/nixos/configuration.nix";
      rebuild = "sudo nixos-rebuild switch";
    };

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "colorize" "git" "colored-man-pages" "ssh" ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.blueman.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ 22 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
