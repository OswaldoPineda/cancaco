class Petition < ApplicationRecord
  validates :title, :description, :quantity, :deadline, :active, presence: true
  belongs_to :category
  belongs_to :company
  belongs_to :measure
  after_create_commit :enqueue_notification

  protected

  def enqueue_notification
    NotificationPetitionJob.perform_later(id)
  end
end
