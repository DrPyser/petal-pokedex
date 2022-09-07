class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :type1
      t.integer :type2
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :generation
      t.boolean :lengendary

      t.timestamps
    end
  end
end
