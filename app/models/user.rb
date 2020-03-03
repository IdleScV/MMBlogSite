class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comment_likes

    
    
    def like(blog)
        Like.create(blog: blog, user_id: self.id)
    end
       
end
