class AddImageToCaughtPokemons < ActiveRecord::Migration
  def change
    add_column :caught_pokemons, :image, :string
  end
end
