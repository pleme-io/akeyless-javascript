{
  description = "JavaScript SDK providing access to the Akeyless API";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless";
    npmDepsHash = "sha256-k+UC7jc6JqKWTskVgs4cXe1o11fy1WxcCov1LAG+UUo=";
    dontNpmBuild = false;
    npmBuildScript = "build";
    description = "JavaScript SDK providing access to the Akeyless API";
  };
}
