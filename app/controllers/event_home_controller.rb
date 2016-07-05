class EventHomeController < ApplicationController

  def home
    @events = Event.all
    @user = current_user
  end

  def about
  end
end
