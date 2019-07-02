FactoryBot.define do
  factory :company do
    affiliation { '1234567890' }
    name { 'Magmalabs' }
    association :category
  end
end
