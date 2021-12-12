class Admins::EventsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :content, :start_time, :end_time)
  end

end
