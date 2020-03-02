class ApplicationController < ActionController::Base
   

    helper_method :current_user

    def current_user
        # memoization
        if session[:user_id]
            @current_user ||= User.find(session[:user_id]).username
        else
            @current_user = "Guest"
        end
        return @current_user
    end

    def homepage
    end
end
