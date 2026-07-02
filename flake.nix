{
  description = "A very basic flake";

  inputs = {
    nixpkgsStable.url = "nixpkgs/nixos-26.05";
    nixpkgsUnstable.url = "nixpkgs/nixos-unstable";

    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
	inputs.nixpkgs.follows = "nixpkgsStable";
    };
  };

  outputs = 
  { self, nixpkgsStable, nixpkgsUnstable, zen-browser, ... } @ inputs:
 let
 	lib = nixpkgsStable.lib;
	system = "x86_64-linux";
	pkgs = nixpkgsStable.legacyPackages.${system};
	pkgsUnstable = nixpkgsUnstable.legacyPackages.${system};
	username = "suuper-lit";
in {
	nixosConfigurations = {
		nixos = lib.nixosSystem {
			inherit system;
			modules = [
				./configuration.nix
				{ environment.systemPackages = [ inputs.zen-browser.packages.${system}.default ]; }
			];
			specialArgs = {
				inherit username;
				inherit pkgsUnstable;
				inherit inputs;
			};
		};
	};
};

}
