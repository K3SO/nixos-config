{
    description = "quesoconfig :D";

    inputs = {

        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, ... }@inputs: {
        
        nixosConfigurations = {

            # === ROG STRIX ===
            rogStrix = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    host = "nix";
                    username = "queso";
                    inherit self inputs;
                };
                modules = [ ./hosts/rogStrix ];
            };

        };
    };
}