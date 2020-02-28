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
        @announcement = User.find
    end

    def destroy

    end
end
