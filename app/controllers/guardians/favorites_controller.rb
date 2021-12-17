class Guardians::FavoritesController < ApplicationController

  def create
    information_for_guardian = InformationForGuardian.find(params[:information_for_guardian_id])
    favorite = current_guardian.favorites.new(information_for_guardian_id: information_for_guardian.id)
    favorite.save
    redirect_to guardians_information_for_guardian_path(information_for_guardian)
  end

  def destroy
    information_for_guardian = InformationForGuardian.find(params[:information_for_guardian_id])
    favorite = current_guardian.favorites.find_by(information_for_guardian_id: information_for_guardian.id)
    favorite.destroy
    redirect_to guardians_information_for_guardian_path(information_for_guardian)
  end

end