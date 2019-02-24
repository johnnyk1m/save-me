class ApplicationController < ActionController::Base
  # Devise - force the user to redirect to the
  # login page if the user was not logged in
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,  :born, :height, :nation])
			 devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,  :born, :height, :nation])
    end
end
