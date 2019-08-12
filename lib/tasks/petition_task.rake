namespace :petition_task do
  desc 'Switch the petition status'

  task disable_petitions: :environment do
    Petition.where(deadline: Time.zone.today).find_in_batches do |petitions|
      petitions.each do |petition|
        petition.update(active: false)
      end
    end
  end
end
