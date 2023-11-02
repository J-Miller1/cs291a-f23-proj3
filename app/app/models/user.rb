class User < ApplicationRecord
    validates :email, presence: true
    validates :bio, presence: true
end
