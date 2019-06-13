FactoryBot.define do
  factory :category do
    sequence(:title) { |i| "category#{i}" }
    association :subcategories
  end
end
