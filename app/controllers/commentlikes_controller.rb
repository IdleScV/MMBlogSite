class CommentlikesController < ApplicationController
  def create
  end

  def destroy
    @like.destroy_all
    @blog = Blog.find(params[:id])
    redirect_to blog_path(@blog)
end

private

def find_blog
    @blog = Blog.find(params[:blog_id])
end

def find_like
    @like = CommentLike.where(comment_id: params[:id], user_id: session[:user_id])
end

end
