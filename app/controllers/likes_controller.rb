class LikesController < ApplicationController
    before_action :find_blog

    def create
        @blog.likes.create(user_id: session[:user_id])
        redirect_to blog_path(@blog)
    end

    private
    def find_blog
        @blog = Blog.find(params[:blog_id])
    end
end