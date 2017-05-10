class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :posts, as: :commentable
  validates :body, :user_id, :commentable_id, :commentable_type, presence: true
end
