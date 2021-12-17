class Guardians::InformationForGuardiansController < ApplicationController
  
  before_action :authenticate_guardian!
  
  
  def index
    @informationforguardians = InformationForGuardian.all
  end

  def show
    @informationforguardian = InformationForGuardian.find(params[:id])
  end
end
