{ config, lib, pkgs, inputs, username, host, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ../../modules/core
        ];

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