class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |exception|
     # redirect_to root_url, alert: exception.message
     redirect_to root_url, alert: "You are not authorized to perform this action."
   end

  protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name, :avatar, :avatar_cache, :role]
   	devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :avatar, :avatar_cache, :role]
   end

end
