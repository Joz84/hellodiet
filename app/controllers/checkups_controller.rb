class CheckupsController < ApplicationController
  def show
    @checkup = Checkup.where(state: 'paid').find(params[:id])
  end

  def calendar
    @planning = Checkup.planning
    @wdays = @planning.keys.map &:to_s
    @checkups = Checkup.all
    @my_bookings = []
  end

  def create
    if booking_params[:time].empty?
      redirect_to calendar_path
    else
      @checkup = Checkup.booking(booking_params, current_user)
      redirect_to new_checkup_payment_path(@checkup)
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :online)
  end

end

