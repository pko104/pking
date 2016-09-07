class RemoveImageFromCaughtPokemons < ActiveRecord::Migration
  def change
    remove_column :caught_pokemons, :image, :string
  end
end
