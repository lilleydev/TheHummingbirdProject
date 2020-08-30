class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

  def show
    @user = User.last
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email)
  end
end
