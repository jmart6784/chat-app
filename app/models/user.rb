class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest, dependent: :destroy
  has_many :requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest, dependent: :destroy
end
