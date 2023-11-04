class User < ApplicationRecord
    has_many :posts

    validates :email, presence: true
    validates :bio, presence: true
end
