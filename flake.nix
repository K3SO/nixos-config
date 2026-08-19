{
    description = "quesoconfig :D";

    inputs = {

        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, home-manager, ... }: {
        
        # "desktop" es el nombre del host.
        nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [

                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.queso = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
                
            ];
        };

    };
}