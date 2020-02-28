class BlogsController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
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
    
    

    private

    def blog_params
        params.require(:blog).permit(:title, :content, :user)
    end


end
