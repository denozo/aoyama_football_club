class GraduatesController < ApplicationController

  def index
    @graduates = Graduate.page(params[:page]).per(10).order(year: "DESC")
  end

  def show
    @graduate = Graduate.find(params[:id])
  end

end
