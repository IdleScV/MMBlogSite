class LikesController < ApplicationController
    before_action :find_blog, only: [:create]
    before_action :find_like, only: [:destroy]

    def create
        @blog.likes.create(user_id: session[:user_id])
        redirect_to blog_path(@blog)
    end

    def destroy
        @like[0].destroy
        @blog = Blog.find(params[:id])
        redirect_to blog_path(@blog)
    end

    private

    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    def find_like
        @like = Like.where(blog_id: params[:id], user_id: session[:user_id])
    end

end