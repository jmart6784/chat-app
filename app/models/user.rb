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

  has_many :chats, foreign_key: :host_id

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 16}, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }

  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 60 }

  validates :bio, length: { maximum: 150 }
end
