class Guardians::HomesController < ApplicationController
  
    before_action :authenticate_guardian!
  

  def show
   @guardian = current_guardian
  end

  def edit
   @guardian = current_guardian
  end

  def update
    guardian = current_guardian
    guardian.update(guardian_params)
    redirect_to guardians_root_path
  end

  private

  def guardian_params
    params.require(:guardian).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :relationship,
      :member_name,
      :year_of_enrollment,
      :postal_code,
      :address,
      :tel)
  end

end