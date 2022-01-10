class InformationsController < ApplicationController

  def index
    @informations = Information.page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end

end
