class Admins::InformationsController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @informations = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    information = Information.new(information_params)

    if information.save
      redirect_to admins_information_path(information), notice: "お知らせを登録しました"
    else
      render :new
    end
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    information = Information.find(params[:id])

    if information.update(information_params)
      redirect_to admins_information_path(information), notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    information = Information.find(params[:id])
    information.destroy
    redirect_to admins_informations_path
  end

  private

  def information_params
    params.require(:information).permit(:category, :title, :content, :image)
  end

end
