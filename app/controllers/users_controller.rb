class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :destroy, :update]
    def index
        @users = User.all
    end
    
    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
           render "new"
        end
    end

    def edit
        
    end

    def update
        @user_new = User.new(user_params)
        if @user_new.valid? 
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user_new)
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :name, :password, :admin)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
