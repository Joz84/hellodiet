class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @formulas = Formula.all
  end

  def dashboard
  end

  def calendar
    @wdays = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
    @planning = { Monday:  {    morning:    [ 9, 10, 11 ],  afternoon:  [ 14, 15, 16, 17] },
                  Tuesday:  {   morning:    [ 9, 10, 11 ],  afternoon:  [ 14, 15, 16, 17] },
                  Wednesday:  { morning:    [ 9, 10, 11 ],  afternoon:  [] },
                  Thursday:  {  morning:    [ 9, 10, 11 ],  afternoon:  [ 14, 15, 16, 17] },
                  Friday:  {    morning:    [ 9, 10, 11 ],  afternoon:  [ 14, 15, 16, 17] },
                  Saturday:  {  morning:    [],             afternoon:  [] },
                  Sunday:  {    morning:    [],             afternoon:  [] }}
    @availabilities = Checkup.availabilities
    @my_checkups = Checkup.where(user: current_user)
  end
end

