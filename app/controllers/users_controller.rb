class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def show
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to sessions_path
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_user_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
