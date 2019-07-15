FactoryBot.define do
  factory :measure do
    sequence(:name) { |i| "measure#{i}" }
  end
end
