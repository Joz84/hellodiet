class CheckupsController < ApplicationController
  def show
    @checkup = Checkup.where(state: 'paid').find(params[:id])
  end

  def localisation
    @user = current_user
    # si adresse vérifier quelle est dans bordeaux métropole
    # afficher un message disnt vous êtes trop loin, consulter en ligne ou modifier l'adresse
    # mettre un marqueur sur la carte
  end

  def create_with_localisation
    raise
    # modifier le user
    # si dans bordeaux => créer le checkup
    # sinon => redirect_to localisation
    #
    # si payment en ligne => redirect_to new_checkup_payment_path(@checkup)
    # sinon direct => redirect_to checkup_path(@checkup)
    @booking_date = DateTime.parse(session[:date])
    @price = Checkup.price(false, current_user)
  end

  def create
    if booking_params[:time].empty?
      redirect_to calendar_path
    else
      if params[:commit] == "En ligne"
        @checkup = Checkup.booking(booking_params, true, current_user)
        redirect_to new_checkup_payment_path(@checkup)
      elsif params[:commit] == "À domicile"
        session[:date] = "#{booking_params[:date]} #{booking_params[:time]}"
        redirect_to localisation_path
      end
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :time)
  end

end

