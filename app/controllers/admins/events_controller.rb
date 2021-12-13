class Admins::EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    
    if event.save
      redirect_to admins_events_path, notice: "予定を登録しました"
    else
      render :new
    end
    
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    event = Event.find(params[:id])
    
    if event.update(event_params)
      redirect_to admins_event_path(event), notice: "予定を変更しました"
    else
      render :edit
    end
    
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to admins_events_path
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :content, :start_time, :end_time)
  end

end
