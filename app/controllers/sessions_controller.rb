class SessionsController < ApplicationController

  # before_action :authenticate_user
  skip_before_action :require_login, only: [:create, :new]
 
  def new
  end

  def create 
    session_params = params.permit(:username, :password)
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to customers_path
    else
      message = "Something is wrong."
      redirect_to new_session_path, notice: message
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
