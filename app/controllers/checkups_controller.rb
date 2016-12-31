class CheckupsController < ApplicationController
  def show
    @checkup = Checkup.where(state: 'paid').find(params[:id])
  end

  def create
    booking_date = DateTime.parse("#{booking_params[:date]} #{booking_params[:time]}")
    online = booking_params[:online] == "true" ? true : false
    price = online ? 24 : 28
    price += 10 if current_user.checkups.empty?
    @checkup = Checkup.new(  date: booking_date,
                                user: current_user,
                                online: online,
                                state:'pending',
                                price: price
                              )
    if booking_params[:time].empty?
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
      raise
      render 'pages/calendar'
    else
      @checkup.save
      redirect_to new_checkup_payment_path(@checkup)
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :online)
  end

end

