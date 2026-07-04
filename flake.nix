{
  description = "Flake for LIT workstation";

  inputs = {
    nixpkgsStable.url = "nixpkgs/nixos-26.05";
    nixpkgsUnstable.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgsStable";
    };
  };

  outputs =
  inputs @ { self, flake-parts, nixpkgsStable, nixpkgsUnstable, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
    {
      imports = [
        ./nixos.nix
        ./modules/zen-browser.nix
      ];
    };

}
