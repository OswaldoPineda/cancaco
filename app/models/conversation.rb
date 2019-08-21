class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy,
                      inverse_of: :conversation
  belongs_to :sender, class_name: :Company
  belongs_to :recipient, class_name: :Company
end
