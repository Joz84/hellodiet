class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @formulas = Formula.all
  end

  def dashboard
  end

  def test
    raise
  end

  def calendar
    @planning = { Sunday:    [],
                  Monday:    [ 9, 10, 11, 14, 15, 16, 17],
                  Tuesday:   [ 9, 10, 11, 14, 15, 16, 17],
                  Wednesday: [ 9, 10, 11],
                  Thursday:  [ 9, 10, 11, 14, 15, 16, 17],
                  Friday:    [ 9, 10, 11, 14, 15, 16, 17],
                  Saturday:  []}
    @wdays = @planning.keys.map &:to_s
    @availabilities = Checkup.availabilities
    @my_checkups = Checkup.where(user: current_user)
  end
end

