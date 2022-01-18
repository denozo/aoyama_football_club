class Admins::InformationsController < ApplicationController

  before_action :authenticate_admin!

  def index

    if params[:tag_name]
      @informations = Information.tagged_with("#{params[:tag_name]}").page(params[:page]).per(10).order(updated_at: "DESC") #タグによる検索
    else
      @informations = Information.page(params[:page]).per(10).order(updated_at: "DESC") #タグ以外の場合
    end

  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)

    if @information.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_information_path(@information)
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
    @information = Information.find(params[:id])

    if @information.update(information_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_information_path(@information)
    else
      render :edit
    end
  end

  def destroy
    information = Information.find(params[:id])

    if information.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_informations_path
    else
      render :index
    end
  end

  private

  def information_params
    params.require(:information).permit(:category, :title, :content, :image, :tag_list)
  end

end
