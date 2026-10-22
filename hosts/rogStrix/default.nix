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

}