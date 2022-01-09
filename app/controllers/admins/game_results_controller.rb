class Admins::GameResultsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @game_results = GameResult.page(params[:page]).per(10)
  end

  def new
    @game_result = GameResult.new
  end

  def create
    @game_result = GameResult.new(game_result_params)
    
    if @game_result.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_game_result_path(@game_result)
    else
      render :new
    end
  end

  def show
    @game_result = GameResult.find(params[:id])
  end

  def edit
    @game_result = GameResult.find(params[:id])
  end

  def update
    @game_result = GameResult.find(params[:id])
    
    if @game_result.update(game_result_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_game_result_path(@game_result)
    else
      render :edit
    end
  end

  def destroy
    game_result = GameResult.find(params[:id])
    game_result.destroy
    redirect_to admins_game_results_path
  end
  
  private
  
  def game_result_params
    params.require(:game_result).permit(:tournament_name, :game_title, :image, :event_date, :results_details)
  end
  
end
