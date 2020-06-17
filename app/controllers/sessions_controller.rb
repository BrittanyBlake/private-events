class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      session[:user_id] = user.id
      flash[:notice] = "welcome #{user.username}. You have been logged in"
      redirect_to user
    else
      flash.now[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to root_path
  end
end
