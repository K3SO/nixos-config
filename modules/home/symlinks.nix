{ config, lib, ... }:

{
    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr/";
        recursive = true;
    };
    xdg.configFile."kitty" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/kitty/";
        recursive = true;
    };
    xdg.configFile."starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/starship.toml";
        recursive = true;
    };
}