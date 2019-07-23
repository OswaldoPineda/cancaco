class NotificationPetitionService
  def initialize(petition)
    @petition = petition
    @companies = Company.where(category_id: petition.category_id).
                         where("id != :id", id: petition.company_id)
  end

  def call
    companies.each do |company|
      Notification.create(recipient: company,
                          company: petition.company,
                          action: petition.title,
                          notifiable: petition)
    end
  end

  private

  attr_reader :petition, :companies
end
