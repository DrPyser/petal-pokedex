nix-shell -p ruby_3_1 --run 'bundler init';
nix-shell -p ruby_3_1 --run 'bundler add rails';
nix-shell -p bundix --run 'bundix -l';
