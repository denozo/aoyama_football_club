class RenameYearColumnToGameResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_results, :year, :event_date
  end
end
