class ChangeInformationsForGuardiansToInformationForGuardians < ActiveRecord::Migration[5.2]
  def change
    rename_table :informations_for_guardians, :information_for_guardians
  end
end
