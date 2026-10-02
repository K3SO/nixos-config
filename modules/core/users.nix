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

        users.${username} = {
            imports = [ ../home ];
            home = {
                username = "${username}";
                homeDirectory = "/home/${username}";
                stateVersion = "26.05";
            };
        };

        backupFileExtension = "hm-backup";
    };
}