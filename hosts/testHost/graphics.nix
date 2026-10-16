{ config, ... }:

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload.enable = true;
            offload.enableOffloadCmd = true;
            amdgpuBusId = "PCI:6:0:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };
}