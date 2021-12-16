class Admins::GuardiansController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @guardians = Guardian.all
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
end
