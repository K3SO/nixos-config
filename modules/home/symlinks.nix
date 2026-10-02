{ config, lib, ... }:

{
    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr/";
        recursive = true;
    };
}