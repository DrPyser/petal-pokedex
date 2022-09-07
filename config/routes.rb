Rails.application.routes.draw do
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

	# first version namespace
	namespace :api do
  	namespace :v1 do
    	resources :pokemons
  	end
	end
	# paginated list of pokemons
  # get "/pokemons", to: "pokemons#index"

  # query info on single pokemon
  # get "/pokemon
  
end
