FactoryBot.define do
  factory :image do
    file { [Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'missing.png'), 'image/png')] }
  end
end
