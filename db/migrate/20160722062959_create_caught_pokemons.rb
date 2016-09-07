class CreateCaughtPokemons < ActiveRecord::Migration
  def change
    create_table :caught_pokemons do |t|
      t.string :username, null: false
      t.integer :combat_power, null: false
      t.integer :pokemon_id, null: false
      t.integer :health_power, null: false
      t.string :location, null: false
      t.string :team_color, null: false
      t.string :first_move, null: false
      t.string :second_move, null: false

      t.timestamps
    end
  end
end
