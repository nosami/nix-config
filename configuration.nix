# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = with pkgs; [
    bashCompletion
    chromium 
    clang
    cmake 
    compton
    dmenu
    emacs
    firefoxWrapper
    gcc 
    git 
    gnumake
    i3
    i3status
    neovim 
    nitrogen
    open-vm-tools
    p7zip
    qutebrowser
    silver-searcher
    subversion
    termite
    unzip 
    vim 
    wget 
    xorg.xrandr
  ];

  # List services that you want to enable:

  services = {

      # Enable the OpenSSH daemon.
      openssh.enable = true;

      # Enable CUPS to print documents.
      # services.printing.enable = true;

    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # services.xserver.layout = "us";
      # services.xserver.xkbOptions = "eurosign:e";
      windowManager.i3.enable = true;

      # Enable the KDE Desktop Environment.
      # services.xserver.displayManager.kdm.enable = true;
      windowManager.default = "i3";
      desktopManager.default = "none";
      desktopManager.xterm.enable = false;
      synaptics = {
        enable = true;
      };
    };
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.jason = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     uid = 1000;
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";
  fonts.fontconfig.dpi = 200;

}
