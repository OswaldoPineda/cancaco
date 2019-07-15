class Notification < ApplicationRecord
  belongs_to :company
  belongs_to :recipient, class_name: 'Company'
  belongs_to :notifiable, polymorphic: true
  after_create_commit :enqueue_relay

  protected

  def enqueue_relay
    NotificationRelayJob.perform_later(id)
  end
end
