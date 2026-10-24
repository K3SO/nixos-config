{ ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./graphics.nix
            ../../modules/core
        ];
    
    # packages.nix
    texteditors.enable = true;
    gaming.enable = true;
    video.enable = true;
    productivity.enable = true;

    # system.nix
    swapsize = 4;
    wheelNeedsPassword.enable = false;
    unfree.enable = true;

}