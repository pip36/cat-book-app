class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :firstname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy

         has_many :friendships, dependent: :destroy
         has_many :recieved_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

         has_many :active_friends, -> {where(friendships:{accepted:true})}, through: :friendships, source: :friend
         has_many :recieved_friends, -> {where(friendships:{accepted:true})}, through: :recieved_friendships, source: :user
         has_many :pending_friends, -> {where(friendships:{accepted:false})}, through: :friendships, source: :friend
         has_many :requested_friendships, -> {where(friendships:{accepted:false})}, through: :recieved_friendships, source: :user

         def friends
           active_friends | recieved_friends
         end

         def pending
           pending_friends | requested_friendships
         end

         mount_uploader :profile_pic, PictureUploader
end
