FactoryBot.define do
  factory :measure do
    sequence(:title) { |i| "measure#{i}" }
  end
end
