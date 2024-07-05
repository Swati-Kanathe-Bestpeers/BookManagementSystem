class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(login_params)
    if @user.save
      redirect_to customers_path
    else
      render 'new'
    end
  end
  
  private
  def login_params
    params.require(:user).permit(name:, psword:)
  end
end
