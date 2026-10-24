{ lib, ... }:

{
    imports = [
        ./audio.nix
        ./boot.nix
        ./de.nix
        ./fonts.nix
        ./locale.nix
        ./networking.nix
        ./packages.nix
        ./system.nix
        ./users.nix
    ];

    # packages.nix
    texteditors.enable = lib.mkDefault false;
    gaming.enable = lib.mkDefault false;
    video.enable = lib.mkDefault false;
    productivity.enable = lib.mkDefault false;

    # system.nix
    swapsize = lib.mkDefault 4;
    wheelNeedsPassword.enable = lib.mkDefault true;
    unfree.enable = lib.mkDefault true;

}