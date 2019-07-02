FactoryBot.define do
  factory :category do
    sequence(:title) { |i| "category#{i}" }
  end
end
