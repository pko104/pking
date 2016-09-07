class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :element_type, null: false
    end
  end
end
