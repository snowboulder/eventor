class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
  end

  def index
    @user = User.all
  end

end
