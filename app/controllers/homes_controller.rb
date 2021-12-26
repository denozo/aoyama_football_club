class HomesController < ApplicationController
  
  def top
     @informations = Information.all
  end

  def about
  end
end
