class Friendship < ApplicationRecord
  belongs_to :friend_a, foreign_key: :user_a, class_name: :User
  belongs_to :friend_b, foreign_key: :user_b, class_name: :User

  validates :user_a, presence: true
  validates :user_b, presence: true
end
