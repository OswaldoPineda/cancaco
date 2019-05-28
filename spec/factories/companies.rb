FactoryBot.define do
  factory :company do
    affiliation { '1234567890' }
    name { 'Magmalabs' }
    phone { '3122925' }
    cellphone { '3121027414' }
    association :user
  end
end
