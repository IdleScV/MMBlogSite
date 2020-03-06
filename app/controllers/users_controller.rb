class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :destroy, :update, :blogs]
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
        @user.propic = Faker::Avatar.image
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
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
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to users_path
    end


    private
    def user_params
        params.require(:user).permit(:username, :name, :password, :admin, :email)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
