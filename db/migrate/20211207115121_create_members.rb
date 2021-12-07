class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      
      t.integer :category_id, mull: false
      t.string :image_id
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :grade, null: false, default: 0
      t.string :position, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.text :originalteam, null: false
      t.text :hobby, null: false
      t.text :goal, null: false

      t.timestamps
    end
  end
end