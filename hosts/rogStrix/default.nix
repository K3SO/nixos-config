{ config, lib, pkgs, inputs, username, host, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            inputs.home-manager.nixosModules.home-manager
        ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    swapDevices = [{
        device = "/var/lib/swapfile";
        size = 4*1024;
    }];

    networking = {
        hostName = "${host}";
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

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        
        # This fix the graphical-session.target not starting problem,
        # not the ideal solution, adds an extra layer, but works.
        # It also has some nice advantages tho.
        # Maybe consider niri??
        withUWSM = true;
    };

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username host; };
        backupFileExtension = "hm-backup";
    };

    # TEMPORAL
    home-manager.users.${username} = {config, pkgs, ...}: {
        home = {
            username = "${username}";
            homeDirectory = "/home/${username}";
            stateVersion = "26.05";
        };
        xdg.configFile."hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr/";
            recursive = true;
        };
    };

    programs.steam.enable = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;   # necesario para Steam/CS2
    };

    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload.enable = true;
            offload.enableOffloadCmd = true;  # crea el comando "nvidia-offload"
            amdgpuBusId = "PCI:6:0:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };

    programs.obs-studio.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        neovim
        vscodium
        wget
        curl
        kitty
        awww
        git
        brave-origin
	    gh
        obsidian
        discord
    ];

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}
