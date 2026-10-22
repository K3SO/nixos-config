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
    productivity.enable = false;

}