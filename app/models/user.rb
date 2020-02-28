class User < ApplicationRecord
    has_many :announcements, dependent: :destroy
    has_many :blogs, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
