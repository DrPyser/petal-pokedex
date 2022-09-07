{
  description = "A Ruby On Rails app providing a REST API for pokemons";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let
      lib = nixpkgs.lib // flake-utils.lib;
      supportedSystems = [ lib.system.x86_64-linux ];
    in lib.eachSystem supportedSystems (system:
      let pkgs = import nixpkgs {
        inherit system;
      };
      baseDependencies = with pkgs; [ ruby_3_1 bundix sqlite ];
      ## currently does not work because of nokogiri build failure with ruby 3.1.2
      # rubyenv = pkgs.bundlerEnv {
      #   ruby = pkgs.ruby_3_1;
      #   name = "pokedex-ruby-env";
      #   gemfile  = ./Gemfile;
      #   lockfile = ./Gemfile.lock;
      #   gemset   = ./gemset.nix;
      # };
    in {

      packages = {

      };

      devShell = pkgs.mkShell {
				packages = baseDependencies;
				shellHook = ''
				echo "Loaded devshell!"
				echo "$(ruby --version)"
				'';
      };

    });
}
