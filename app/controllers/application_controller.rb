class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters_sign_up,
                :configure_permitted_parameters_update, if: :devise_controller?

  protected

  def configure_permitted_parameters_sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :aga_number])
  end

  def configure_permitted_parameters_update
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :aga_number])
  end

end
