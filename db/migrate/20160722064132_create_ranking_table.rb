class CreateRankingTable < ActiveRecord::Migration
  def change
    create_table :ranking_tables do |t|
      t.integer :pokemon_limit, null: false
      t.string :name, null: false
    end
  end
end
