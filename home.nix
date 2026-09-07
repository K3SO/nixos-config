{ config, pkgs, lib, ... }:

{
    home.username = "queso";
    home.homeDirectory = "/home/queso";
    home.stateVersion = "26.05";

    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr/";
        recursive = true;
    };
}