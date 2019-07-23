FactoryBot.define do
  factory :petition do
    title { 'Petition of wheels' }
    description { 'required wheels of bus' }
    quantity { 5 }
    deadline { '2019-06-30' }
    active { true }
  end
end
