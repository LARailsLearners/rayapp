class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |exception|
    a=[]
    a = exception.message.split(" ").map(&:capitalize).join(" ").split("?")
     # redirect_to root_url, alert: exception.message
     redirect_to root_url, alert: "#{a.first}"
   end

   #This method is for activeadmin to only allow admin users to acces the admin page from the url
def authenticate_admin_user!
  raise SecurityError unless current_user.admin?
end

rescue_from SecurityError do |exception|
  redirect_to root_url, alert: "You are not authorized to access this page"
end
  protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name, :avatar, :avatar_cache, :role]
   	devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :avatar, :avatar_cache, :role]
   end

end
