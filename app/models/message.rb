class Message < ApplicationRecord
  validates :message, presence: true
  belongs_to :conversation
  belongs_to :user
  belongs_to :recipient, class_name: :User
end
