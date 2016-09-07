class AddColumnToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :img_src, :string
  end
end
