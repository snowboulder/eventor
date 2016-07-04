class EventsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @vent.save
      flash[:success] = "Event '#{@post.title}' created!"
      redirect_to root_path
    else
      render 'new'
    end
  end


  private

  def events_params
    params.require(:event).permit(:title, :description, :date, :location)
  end

end
