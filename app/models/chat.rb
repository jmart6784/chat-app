class Chat < ApplicationRecord
  belongs_to :host, 
    class_name: :User, 
    foreign_key: :host_id, 
    optional: true

  has_many :messages, dependent: :destroy

  has_many :joined_chats, dependent: :destroy
  has_many :users, through: :joined_chats

  validates :name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :host_id, presence: true
end
