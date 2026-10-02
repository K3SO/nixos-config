{ config, lib, pkgs, inputs, username, host, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./graphics.nix
            ../../modules/core
        ];

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}