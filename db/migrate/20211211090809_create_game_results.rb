class CreateGameResults < ActiveRecord::Migration[5.2]
  def change
    create_table :game_results do |t|
      t.string :tournament_name, null: false
      t.string :game_title, null: false
      t.string :image_id
      t.datetime :year, null: false
      t.text :results_details, null: false

      t.timestamps
    end
  end
end
