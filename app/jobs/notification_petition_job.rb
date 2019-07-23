class NotificationPetitionJob < ApplicationJob
  queue_as :notifications

  def perform(petition_id)
    petition = Petition.find(petition_id)
    NotificationPetitionService.new(petition).call
  end
end
