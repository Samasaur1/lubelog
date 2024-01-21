{
  description = "";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs";
    # flockenzeit.url = "github:balsoft/Flockenzeit";
  };

  outputs = { self, nixpkgs, ... }:
    let
      forAllSystems = gen:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
        (system: gen nixpkgs.legacyPackages.${system});
    in {
      packages = forAllSystems (pkgs: rec {
        lubelog = pkgs.callPackage ./. {};
        default = lubelog;
      });
      # nixosModules = rec {
      #   remote-text-server = import ./module.nix;
      #   default = remote-text-server;
      # };
    };
}
