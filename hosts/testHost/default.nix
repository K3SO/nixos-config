{ ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./graphics.nix
            ../../modules/core
        ];

    # packages.nix
    texteditors.enable = false;
    gaming.enable = false;
    video.enable = false;
    music.enable = false;
    gamedev.enable = true;
    desktop.enable = true;
    productivity.enable = false;

    # system.nix
    swapsize = 4;
    wheelNeedsPassword.enable = true;
    unfree.enable = true;

}