class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username:params[:session][:username].downcase)
        if user
            session[:user_id] = user.id
            flash[:notice] = "welcome #{user.username}. You have been logged in"
            redirect_to user
        else
            flash[:alert] = "something went wrong"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You've been logged out"
    end
end
