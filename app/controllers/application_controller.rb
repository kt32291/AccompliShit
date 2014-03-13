class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :config_permitted_parameters, if: :devise_controller?

  def config_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :email, :birthday, :avatar]
    devise_parameter_sanitizer.for(:sign_in) << :username
  end
end

