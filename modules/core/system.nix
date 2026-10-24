{ lib, config, ... }:

{
    options = {
        swapsize = lib.mkOption {
            type = lib.types.ints.positive;
            default = 4;
            description = "Sets swapfile size in GiB";
        };
        wheelNeedsPassword.enable = lib.mkEnableOption "Makes wheel group need to enter the password to execute sudo";
        unfree.enable = lib.mkEnableOption "Enables unfree packages";
    };

    config = {
        swapDevices = [{
            device = "/var/lib/swapfile";
            size = config.swapsize * 1024;
        }];

        security.sudo.wheelNeedsPassword = config.wheelNeedsPassword.enable;

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
        nixpkgs.config.allowUnfree = lib.mkIf config.unfree.enable true;
        system.stateVersion = "26.05";
    };
}