class BlogsController < ApplicationController

    before_action :find_blog, only:[:show, :edit, :destroy, :update, :is_liked?, :newcomment]
    def index
        @blogs = Blog.all.reverse
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
        id = @blog.user_id
        @blog.destroy
        if params["user_page"] == "true"
            redirect_to user_path(id)
        else
            redirect_to blogs_path
        end
        
    end

    def newcomment
        Comment.create(content: params[:content], user_id: session[:user_id], blog: @blog )
        redirect_to blog_path(@blog)
    end

    def newcommentlike
       like =  CommentLike.create(comment_id: params[:id], user_id: session[:user_id])
        redirect_to blog_path(like.comment.blog.id)
    end
    
    def is_liked?
        Like.find_by(blog_id: @blog.id, user_id: session[:user_id]).exists?
    end

    def destroycommentlike
        @commentlike = CommentLike.where(comment_id: params[:id], user_id: session[:user_id])
        blog = @commentlike[0].comment.blog
        @commentlike.destroy_all
        redirect_to blog_path(blog)
    end


    private

    def blog_params
        params.require(:blog).permit(:title, :content, :user_id)
    end

    def find_blog
        @blog = Blog.find(params[:id])
    end

end
