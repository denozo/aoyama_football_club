class Admins::EventsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_events_path
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
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_event_path(@event)
    else
      render :edit
    end
    
  end

  def destroy
    event = Event.find(params[:id])
    
    if event.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_events_path
    else
      render :index
    end

  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :content, :start_time, :end_time)
  end

end
