class AnnouncementsController < ApplicationController

    before_action :find_announcement, only: [:show, :edit, :destroy, :update]

    def index
        @announcements = Announcement.all
    end

    def show
    end

    def new
        @announcement = Announcement.new
    end

    def create
        @announcement = Announcement.new(announcement_params)
        if @announcement.valid?
            @announcement.save
            redirect_to announcement_path(@announcement)
        else
            render "new"
        end
    end

    def edit
    end

    def update
        @announcement_new = Announcement.new(announcement_params)
        if @announcement_new.valid?
            @announcement.update(announcement_params)
            redirect_to announcement_path(@announcement)
        else
            redirect_to edit_announcement_path(@announcement_new)
        end
    end

    def destroy
        @announcement.destroy
        redirect_to announcements_path
    end

    private
    def announcement_params
        params.require(:announcement).permit(:title, :user_id, :content)
    end

    def find_announcement
        @announcement = Announcement.find(params[:id])
    end
end
