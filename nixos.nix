{ inputs, ... }:

let
  system = "x86_64-linux";
  pkgs = inputs.nixpkgsStable.legacyPackages.${system};
  pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.${system};
  username = "suuper-lit";
in {
  flake.nixosConfigurations.nixos = inputs.nixpkgsStable.lib.nixosSystem {
    inherit system;

    modules = [
      ./configuration.nix
      inputs.self.nixosModules.zen-browser
    ];

    specialArgs = {
      inherit username pkgsUnstable inputs;
    };
  };
}
