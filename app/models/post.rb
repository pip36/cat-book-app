class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader

  validates :title, presence: true, length: {in: 2..24}
  validates :body, presence: true, length: {in: 2..250}
  validate :picture_size



private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5mb")
    end
  end
end
