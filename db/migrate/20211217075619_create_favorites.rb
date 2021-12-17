class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :guardians_id
      t.integer :information_for_guardians_id

      t.timestamps
    end
  end
end
