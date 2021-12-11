class Admins::GraduatesController < ApplicationController

  def index
    @graduates = Graduate.all
  end

  def new
    @graduate = Graduate.new
  end

  def create
    graduate = Graduate.new(graduate_params)
    graduate.save
    redirect_to admins_graduate_path(graduate)
  end

  def show
    @graduate = Graduate.find(params[:id])
  end

  def edit
    @graduate = Graduate.find(params[:id])
  end

  def update
    graduate = Graduate.find(params[:id])
    graduate.update(graduate_params)
    redirect_to admins_graduate_path(graduate)
  end

  def destroy
    graduate = Graduate.find(params[:id])
    graduate.destroy
    redirect_to admins_graduates_path
  end

  private

  def graduate_params
    params.require(:graduate).permit(:image, :year, :member_list, :career_after_graduation)
  end

end
