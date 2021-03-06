class ApplicationController < ActionController::Base
   

    helper_method :current_user

    def current_user
        # memoization
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = "Guest"
        end
        return @current_user
    end

    def homepage
        @blogs = Blog.all.reverse
    end


end
