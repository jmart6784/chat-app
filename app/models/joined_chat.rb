class JoinedChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :user_id, presence: true
  validates :chat_id, presence: true
end
