class Invite < ApplicationRecord
  belongs_to :host, class_name: :User
  belongs_to :guest, class_name: :User
  belongs_to :chat

  validates :host_id, presence: true
  validates :guest_id, presence: true
end
