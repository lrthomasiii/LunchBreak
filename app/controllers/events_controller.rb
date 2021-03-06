class EventsController < ApplicationController
  def index
    if user_signed_in?
      @events = Event.all
    else
      @events = []
    end
  end

  def new
    if user_signed_in?
      @event = Event.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@event = Event.new(event_params)
  	if @event.user_id != current_user.id
      render 'new'
    else
      if @event.save
        Notifications.new_event(@event).deliver
        redirect_to events_path
      else
        render 'new'
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.user_id != current_user.id
      render 'edit'
    else
      if @event.update_attributes(event_params)
        redirect_to event_path(@event.id)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  
  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :description, :user_id)
  end
end
