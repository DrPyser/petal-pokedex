with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "petal-pokedex-bundler-env";
    ruby = ruby_3_1;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "petal-pokedex";
  buildInputs = [ env env.wrappedRuby ];
}
