class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @upcoming_events = current_user.attending_events.upcoming_events
    @previous_events = current_user.attending_events.previous_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome #{@user.username}. You have been signed up"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
