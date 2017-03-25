class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @checkups = current_user.checkups
    @past_checkups = Checkup.where(user: current_user, state: "past")
  end

  def video
  end

  def calendar
    @planning = Checkup.planning
    @wdays = @planning.keys.map &:to_s
    @checkups = Checkup.all
    @my_bookings = []
  end


end

