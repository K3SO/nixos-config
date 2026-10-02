{ config, lib, pkgs, inputs, username, host, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ../../modules/core
        ];

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

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}