class Admins::GuardiansController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @guardians = Guardian.all
  end
  
  def show
    @guardian = Guardian.find(params[:id])
  end
  
  def edit
    @guardian = Guardian.find(params[:id])
  end
  
  def update
    guardian = Guardian.find(params[:id])
    
    if guardian.update(game_result_params)
      redirect_to admins_guardian_path(guardian), notice: "変更を保存"
    else
      render :edit
    end
  end
  
  def destroy
    guardian = Guardian.find(params[:id])
    guardian.destroy
    redirect_to admins_guardians_path
  end
  
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
