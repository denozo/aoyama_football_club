class Admins::GraduatesController < ApplicationController
  def index
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
  end

  def update
  end

  def destroy
  end

  private

  def graduate_params
    params.require(:graduate).permit(:image, :year, :member_list, :career_after_graduation)
  end

end
