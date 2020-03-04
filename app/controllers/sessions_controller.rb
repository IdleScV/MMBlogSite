class SessionsController < ApplicationController

    def new
    end
  
    def create
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to homepage_path
      elsif !user
          flash[:notice] = "No User Found with Username Found"
          render :new
      else
          flash[:notice] = "Password Incorrect"
          render :new 
      end
    end
  
    def logout
      session.clear
      redirect_to login_path
    end
    
end
