class RenameGuardiansIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :guardians_id, :guardian_id
  end
end
