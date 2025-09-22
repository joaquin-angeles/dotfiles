{
    description = "Joaquin's NixOS installation";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
        in {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.joaquin = import ./home.nix;
                        home-manager.backupFileExtension = "backup";
                    }
                ];
            };
        };
}
