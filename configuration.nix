{ config, lib, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
        ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking = {
        hostName = "nix";
        networkmanager.enable = true;
        nameservers = [
            "1.1.1.1"
            "8.8.8.8"
        ];
        firewall = {
            enable = true;
            # allowedTCPPorts = [  ];
        };
    };

    time.timeZone = "Europe/Madrid";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "es_ES.UTF-8";
        LC_IDENTIFICATION = "es_ES.UTF-8";
        LC_MEASUREMENT = "es_ES.UTF-8";
        LC_MONETARY = "es_ES.UTF-8";
        LC_NAME = "es_ES.UTF-8";
        LC_NUMERIC = "es_ES.UTF-8";
        LC_PAPER = "es_ES.UTF-8";
        LC_TELEPHONE = "es_ES.UTF-8";
        LC_TIME = "es_ES.UTF-8";
    };

    console.keyMap = "us-acentos";

    services.displayManager.ly.enable = true;

    programs.hyprland.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    users.users."queso" = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    programs.brave-origin.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        neovim
        vscodium
        wget
        curl
        kitty
        awww
        git
    ];

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}

