class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates :accepted, inclusion: {in: [true, false]}
end
