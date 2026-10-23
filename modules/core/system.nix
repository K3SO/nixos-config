{ lib, config, ... }:

{
    options = {
        unfree.enable = lib.mkEnableOption "Enables unfree packages";
        swapsize = lib.mkOption {
            type = lib.types.ints.positive;
            default = 4;
            description = "Sets swapfile size in GiB";
        };
    };

    config = {
        swapDevices = [{
            device = "/var/lib/swapfile";
            size = config.swapsize * 1024;
        }];

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
        nixpkgs.config.allowUnfree = lib.mkIf config.unfree.enable true;
        system.stateVersion = "26.05";
    };
}