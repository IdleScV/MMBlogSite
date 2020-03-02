class BlogsController < ApplicationController

    before_action :find_blog, only:[:show, :edit, :destroy, :update, :is_liked?]
    def index
        @blogs = Blog.all
    end

    def show

    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.valid?
            @blog.save
            redirect_to blog_path(@blog)
        else
           render "new"
        end
    end

    def edit
        
    end

    def update
        @blog_new = Blog.new(blog_params)
        if @blog_new.valid?
            @blog.update(blog_params)
            redirect_to blog_path(@blog)
        else
            redirect_to edit_blog_path(@blog_new)
        end
    end

    def destroy
        @blog.destroy
        redirect_to blogs_path
    end
    
    def is_liked?
        Like.find_by(blog_id: @blog.id, user_id: session[:user_id]).exists?
    end


    private

    def blog_params
        params.require(:blog).permit(:title, :content, :user_id)
    end

    def find_blog
        @blog = Blog.find(params[:id])
    end

end
