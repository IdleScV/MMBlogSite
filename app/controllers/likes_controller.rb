class LikesController < ApplicationController
    before_action :find_blog
    before_action :find_like, only: :destroy

    def create
        @blog.likes.create(user_id: session[:user_id])
    end

    def destroy
        @like.destroy
    end

    private

    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    def find_like
        @like = Like.find_by(blog_id: @blog.id, user_id: session[:user_id])
    end

end