class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :body, presence: true
end
