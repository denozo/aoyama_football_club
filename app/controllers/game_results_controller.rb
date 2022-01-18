class GameResultsController < ApplicationController
  
  def index
    @game_results = GameResult.order(event_date: "DESC").page(params[:page]).per(10)
  end

  def show
    @game_result = GameResult.find(params[:id])
  end

end
