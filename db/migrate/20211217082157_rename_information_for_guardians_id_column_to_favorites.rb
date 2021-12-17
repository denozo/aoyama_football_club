class RenameInformationForGuardiansIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :information_for_guardians_id, :information_for_guardian_id
  end
end
