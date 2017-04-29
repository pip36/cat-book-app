class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy

         has_many :relationships, class_name: "Relationship",
                                  foreign_key: "from_id"

         has_many :friends, through: :relationships, source: :to

         mount_uploader :profile_pic, PictureUploader
end
