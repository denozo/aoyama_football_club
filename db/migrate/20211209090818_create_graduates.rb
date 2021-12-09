class CreateGraduates < ActiveRecord::Migration[5.2]
  def change
    create_table :graduates do |t|
      t.integer :year, null: false
      t.string :image_id
      t.text :member_list, null: false
      t.text :career_after_graduation, null: false

      t.timestamps
    end
  end
end
