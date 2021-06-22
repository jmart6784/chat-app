class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :user_id, presence: true
  validates :chat_id, presence: true
  validates :content, presence: true, length: { minimum: 1, maximum: 640 }
end
