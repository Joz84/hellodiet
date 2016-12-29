class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    user_data = [:first_name, :last_name, :address, :complement, :zip_code, :city, :country, :birthday, :gender, :size]

    devise_parameter_sanitizer.permit(:sign_up, keys: user_data)
    devise_parameter_sanitizer.permit(:account_update, keys: user_data)
  end


end
