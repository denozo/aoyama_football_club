class RenameOriginalteamColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :originalteam, :original_team
  end
end
