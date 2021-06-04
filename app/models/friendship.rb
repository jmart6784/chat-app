class Friendship < ApplicationRecord
  validates :user_a, presence: true
  validates :user_b, presence: true
end
