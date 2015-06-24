class UsersController < ApplicationController
  def index
  end

  def show
  end
  def update
    if current_user.update_attributes(user_params)
      flash[:notice]= "User information Updated"
      redirect_to edit_user_registration_path
    else
      flash[:error]= "Invalid user information"
      redirect_to edit_user_registration_path
    end
end

  def edit
  end

  def new
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :role)
  end
end
