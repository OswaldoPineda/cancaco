class Notification < ApplicationRecord
  belongs_to :company
  belongs_to :recipient, class_name: 'Company'
  belongs_to :notifiable, polymorphic: true
end
