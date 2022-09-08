# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# TODO: create records from csv at url https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6

require 'csv'

File.open("db/pokemon.csv") do |file|
  puts file.readline
  csv = CSV.new(file.read, headers: [
    :sequence,:name,:type1,:type2,:total,:hp,:attack,
    :defense,:special_attack,:special_defense,:speed,
    :generation,:lengendary]).each do |row|
    puts row.to_hash
    Pokemon.create(row.to_hash)
  end
end
