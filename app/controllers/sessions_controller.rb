class SessionsController < ApplicationController
  def home; end

  def new; end

  def create
    user = User.find_by(username: params[:user][:username])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:message] = 'Unable to verify login information, please try again'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
