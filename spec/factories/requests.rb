FactoryBot.define do
  factory :request do
    title { 'Request of wheels' }
    description { 'required wheels of bus' }
    quantity { 5 }
    deadline { '2019-06-30' }
    active { true }
    association :measure
    association :category
    association :company
  end
end