class Chat < ApplicationRecord
  belongs_to :host, class_name: :User, foreign_key: :host_id, optional: true

  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :host_id, presence: true
end
