class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to events_path
  	else
  		render 'new'
  	end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event.id)
    else
      render 'edit'
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
