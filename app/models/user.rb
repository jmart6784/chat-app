class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :requests_as_requestor, 
    foreign_key: :requestor_id, 
    class_name: :FriendRequest, 
    dependent: :destroy
  has_many :requests_as_receiver, 
    foreign_key: :receiver_id, 
    class_name: :FriendRequest, 
    dependent: :destroy

  has_many :friendships_as_friend_a, 
    foreign_key: :user_a, 
    class_name: :Friendship, 
    dependent: :destroy
  has_many :friendships_as_friend_b, 
    foreign_key: :user_b, 
    class_name: :Friendship, 
    dependent: :destroy

  has_many :friend_as, 
    through: :friendships_as_friend_b, 
    dependent: :destroy
  has_many :friend_bs, 
    through: :friendships_as_friend_a, 
    dependent: :destroy
end
