class CreateUploadedPokemon < ActiveRecord::Migration
  def change
    create_table :uploaded_pokemons do |t|
      t.string :image
    end
  end
end
