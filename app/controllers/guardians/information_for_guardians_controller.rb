class Guardians::InformationForGuardiansController < ApplicationController
  
  before_action :authenticate_guardian!
  
  
  def index
    @informationforguardians = InformationForGuardian.page(params[:page]).per(10)
  end

  def show
    @informationforguardian = InformationForGuardian.find(params[:id])
  end
  
end
