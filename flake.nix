{
  description = "JavaScript SDK providing access to the Akeyless API";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-k+UC7jc6JqKWTskVgs4cXe1o11fy1WxcCov1LAG+UUo="; # TODO: set correct hash
        dontNpmBuild = false;
        npmBuildScript = "build";
        meta = {
          description = "JavaScript SDK providing access to the Akeyless API";
          homepage = "https://github.com/pleme-io/akeyless-javascript";
          license = pkgs.lib.licenses.unlicense;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
