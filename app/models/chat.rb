class Chat < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: :id

  validates :name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :host_id, presence: true
end
