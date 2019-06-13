FactoryBot.define do
  factory :subcategory do
    sequence(:title) { |i| "subcategory#{i}" }
    association :category
  end
end
