class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :blog
    has_many :comment_likes
end
