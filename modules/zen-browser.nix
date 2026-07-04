{inputs, ...}:
let
  system = "x86_64-linux";
in {
  flake.nixosModules.zen-browser = {
    environment.systemPackages = [
      inputs.zen-browser.packages.${system}.default
    ];
  };
}
