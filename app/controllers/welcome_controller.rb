class WelcomeController < ApplicationController
  def index
    # Select events not held yet.
    @events = Event.where('start_time > ?', Time.zone.now).order(:start_time)
  end
end
