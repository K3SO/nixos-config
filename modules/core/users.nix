{ inputs, username, host, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username host; };
        backupFileExtension = "hm-backup";
    };

    # TEMPORAL
    home-manager.users.${username} = {config, ...}: {
        home = {
            username = "${username}";
            homeDirectory = "/home/${username}";
            stateVersion = "26.05";
        };
        xdg.configFile."hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr/";
            recursive = true;
        };
    };
}