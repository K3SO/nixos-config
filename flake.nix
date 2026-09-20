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
        
        # === ROG STRIX ===
        nixosConfigurations.rogStrix = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [

                ./hosts/rogStrix
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