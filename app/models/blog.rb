class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    validates :title, presence: true

end
