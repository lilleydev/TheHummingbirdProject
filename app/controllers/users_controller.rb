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
    redirect_if_logged_out
    @user = User.find_by_id(params[:id])
    redirect_to '/' unless @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email)
  end
end
