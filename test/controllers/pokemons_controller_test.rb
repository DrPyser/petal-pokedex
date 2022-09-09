require "test_helper"
require "json"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemons(:one)
  end

  test "should get index" do
    get pokemons_url, as: :json
    # puts @response.body
    assert_response :success
  end

  test "should get page" do
    get pokemons_url + "?page=1&per=2", as: :json 
    assert_response :success
    # puts @response.parsed_body
    assert_equal @response.parsed_body.length, 2
  end

  test "should create pokemon" do
    assert_difference("Pokemon.count") do
      post pokemons_url, params: { pokemon: { attack: @pokemon.attack, defense: @pokemon.defense, generation: @pokemon.generation, hp: @pokemon.hp, lengendary: @pokemon.lengendary, name: @pokemon.name, special_attack: @pokemon.special_attack, special_defense: @pokemon.special_defense, speed: @pokemon.speed, total: @pokemon.total, type1: @pokemon.type1, type2: @pokemon.type2 } }, as: :json
    end

    assert_response :created
  end

  test "should show pokemon" do
    get pokemon_url(@pokemon), as: :json
    assert_response :success
  end

  test "should update pokemon" do
    patch pokemon_url(@pokemon), params: { pokemon: { attack: @pokemon.attack, defense: @pokemon.defense, generation: @pokemon.generation, hp: @pokemon.hp, lengendary: @pokemon.lengendary, name: @pokemon.name, special_attack: @pokemon.special_attack, special_defense: @pokemon.special_defense, speed: @pokemon.speed, total: @pokemon.total, type1: @pokemon.type1, type2: @pokemon.type2 } }, as: :json
    assert_response :success
  end

  test "should destroy pokemon" do
    assert_difference("Pokemon.count", -1) do
      delete pokemon_url(@pokemon), as: :json
    end

    assert_response :no_content
  end
end
