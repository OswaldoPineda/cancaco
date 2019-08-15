FactoryBot.define do
  factory :petition do
    title { 'Petition of wheels' }
    description { 'required wheels of bus' }
    quantity { 5 }
    deadline { Time.current + 1.day }
    active { true }
  end
end
