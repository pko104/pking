class AddColumnToCaughtPokemons < ActiveRecord::Migration
  def change
    add_column :caught_pokemons, :pokemon_name, :string, null: false
  end
end
