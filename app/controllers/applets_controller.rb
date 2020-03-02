class AppletsController < ApplicationController

    before_action :find_applet, only: [:show, :edit, :destroy, :update]
# * Show all applets from new to old
    def index
        @applets = Applet.all.reverse
    end

    def show
    end

    def new
        @applet = Applet.new
    end

    def create
        @applet = Applet.new(applet_params)
        if @applet.valid?
            @applet.save
            redirect_to applet_path(@applet)
        else
            render "new"
        end
    end

    def edit
    end

    def update
        @applet_new = Applet.new(applet_params)
        if @applet_new.valid?
            @applet.update(applet_params)
            redirect_to applet_path(@applet)
        else
            redirect_to edit_applet_path(@applet_new)
        end
    end

    def destroy
        @applet.destroy
        redirect_to applets_path
    end

    private
    def applet_params
        params.require(:applet).permit(:title, :user_id, :content)
    end

    def find_applet
        @applet = Applet.find(params[:id])
    end
end
