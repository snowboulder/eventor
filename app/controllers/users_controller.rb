class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :event_creator, only: :invite

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  def index
    @user = User.all
  end

  def invite
    user_invited = User.find(params[:user_id])
    event_user_invited_to = Event.find(params[:event_id])
    user_invited.attended_events << event_user_invited_to
    redirect_to @event
  end

  private

  def event_creator
    unless current_user?(Event.find(params[:event_id]).creator)
      redirect_to root_path
    end
  end

end
