class Admins::GraduatesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @graduates = Graduate.page(params[:page]).per(10).order(year: "DESC")
  end

  def new
    @graduate = Graduate.new
  end

  def create
    @graduate = Graduate.new(graduate_params)

    if @graduate.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_graduate_path(@graduate)
    else
      render :new
    end
  end

  def show
    @graduate = Graduate.find(params[:id])
  end

  def edit
    @graduate = Graduate.find(params[:id])
  end

  def update
    @graduate = Graduate.find(params[:id])

    if @graduate.update(graduate_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_graduate_path(@graduate)
    else
      render :edit
    end
  end

  def destroy
    graduate = Graduate.find(params[:id])

    if graduate.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_graduates_path
    else
      render :index
    end
  end

  private

  def graduate_params
    params.require(:graduate).permit(:image, :year, :member_list, :career_after_graduation)
  end

end
