class Conversation < ApplicationRecord
  belongs_to :sender, class_name: :Company
  belongs_to :recipient, class_name: :Company
  belongs_to :subject, polymorphic: true
end
