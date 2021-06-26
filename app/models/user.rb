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
    through: :friendships_as_friend_b

  has_many :friend_bs, 
    through: :friendships_as_friend_a

  has_many :hosted_chats, 
    foreign_key: :host_id,
    class_name: :Chat, 
    dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :invites_as_host, 
    foreign_key: :host_id, 
    class_name: :Invite, 
    dependent: :destroy

  has_many :invites_as_guest, 
    foreign_key: :guest_id, 
    class_name: :Invite, 
    dependent: :destroy

  has_many :joined_chats, dependent: :destroy
  has_many :chats, through: :joined_chats, dependent: :destroy

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 16}, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }

  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 60 }

  validates :bio, length: { maximum: 150 }
end
