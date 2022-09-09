# dump records url https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6 to file at db/pokemon.csv

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
