class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :category, null: false, default: 0
      t.string :title, null: false
      t.text :content, null: false
      t.string :image_id

      t.timestamps
    end
  end
end